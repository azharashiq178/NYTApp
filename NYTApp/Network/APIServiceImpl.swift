//
//  APIServiceImpl.swift
//  Adesys Alarm
//
//  Created by Ishak Guclu on 18/09/2019.
//  Copyright © 2019 Adesys. All rights reserved.
//

import Foundation

protocol ApiClient: class {
    
    var userManager: UserProtocol { get }
    
    func fetchNews(completion : @escaping ((Result<NewsData>) -> Void))
    
    
}

class ApiClientImpl {
    var userManager: UserProtocol
    var session: URLSession = URLSession(configuration: .default)
    
    init() {
        userManager = UserManager()
    }
    
    var objectCacher: RepositoryCacherProtocol {
        userManager.objectCacher
    }
    
    
}

extension ApiClientImpl: GenericClient {
    private func getToken() -> String? {
        
        return ""
    }
}

extension ApiClientImpl: ApiClient {
    
    func fetchNews(completion : @escaping ((Result<NewsData>) -> Void)) {
        
        guard let request = NYTApis.fetchNews.getAuthorizedRequest(headers: []) else { return }
        
        fetch(with: request) { (response: Result<NewsData>) in
            
            completion(response)
            
//            switch response {
//            case .success(let result, _):
//                print("Here")
//                break
//            case .failure(let error, _):
//
//                break
//            }
            
        }
        
    }
    
}



extension Data {

    /// Append string to Data
    ///
    /// Rather than littering my code with calls to `data(using: .utf8)` to convert `String` values to `Data`, this wraps it in a nice convenient little extension to Data. This defaults to converting using UTF-8.
    ///
    /// - parameter string:       The string to be added to the `Data`.

    mutating func append(_ string: String, using encoding: String.Encoding = .utf8) {
        if let data = string.data(using: encoding) {
            append(data)
        }
    }
}
