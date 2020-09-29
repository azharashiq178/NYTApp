//
//  ApiClient.swift
//  Adesys Alarm
//
//  Created by Ishak Guclu on 18/09/2019.
//  Copyright © 2019 Adesys. All rights reserved.
//

import Foundation

protocol GenericClient {
    var session: URLSession { get }
    func fetch<T: Decodable>(with request: URLRequest,
                             completion: @escaping (Result<T>) -> Void) 
}

extension GenericClient {    
    typealias JSONTaskCompletionHandler<T: Decodable> = (T?, APIError?,Int) -> Void
    
    private func decodingTask<T: Decodable>(with request: URLRequest, decodingType: T.Type, completionHandler completion: @escaping JSONTaskCompletionHandler<T>) -> URLSessionDataTask {
        
        let task = session.dataTask(with: request) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(nil, .requestFailed(description: error?.localizedDescription ?? "No description"), 401)
                return
            }
            let json = try? JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary
            
            debugPrint(json ?? "issue")
            
            guard httpResponse.statusCode == 200  else {
                completion(nil, .responseUnsuccessful(statusCode: "\(httpResponse.statusCode)"), httpResponse.statusCode)
                return
            }
            
            if (json == nil) {
                completion("Done" as? T,nil, httpResponse.statusCode)
                return
            }
            guard let data = data else { completion(nil, .invalidData, httpResponse.statusCode); return }
            do {
                let genericModel = try AdesysDecoder().decode(decodingType, from: data)
                completion(genericModel, nil, httpResponse.statusCode)
            } catch let err {
                completion(nil, .jsonConversionFailure(description: "\(err.localizedDescription)"), httpResponse.statusCode)
            }
        }
        return task
    }
    
    func fetch<T: Decodable>(with request: URLRequest, completion: @escaping (Result<T>) -> Void) {
        fetch(with: request, completion: completion, counter: 0)
    }
    /// success respone executed on main thread.
    private func fetch<T: Decodable>(with request: URLRequest, completion: @escaping (Result<T>) -> Void, counter: Int) {
        
        let task = decodingTask(with: request, decodingType: T.self) { (receivedObj, error, statusCode) in
            DispatchQueue.main.async {
                guard let newReceivedObj = receivedObj else {
                    if error != nil {
                        if counter == 1 { // probeer twee x
                            completion(.failure(error!, statusCode))
                        } else {
                            self.fetch(with: request, completion: completion, counter: counter + 1)
                        }
                    } else {
                        completion(.failure(.invalidData, statusCode))
                    }
                    return
                }
                completion(.success(newReceivedObj, statusCode))
            }
        }
        task.resume()
    }
}
