//
//  EndPoint.swift
//  Adesys Alarm
//
//  Created by Ishak Guclu on 18/09/2019.
//  Copyright © 2019 Adesys. All rights reserved.
//

import Foundation
protocol Endpoint {
    var path: String { get }
}

extension Endpoint {
    
    var urlComponents: URLComponents? {
        guard var components = URLComponents(string: NYTApis.base) else { return nil }
        components.path = path
        return components
    }
    
    var request: URLRequest? {
        
        guard let url = urlComponents?.url ?? URL(string: "\(NYTApis.base)\(path)") else { return nil }
        let request = URLRequest(url: url)
        return request
    }
    
    func getAuthorizedRequest(headers: [HTTPHeader]) -> URLRequest? {
        guard var request = request else { return nil }
        headers.forEach { request.addValue($0.header.value, forHTTPHeaderField: $0.header.field) }
        return request
    }
    
    
    func getAuthorizedRequest<T: Encodable>(parameters: T,headers: [HTTPHeader]) -> URLRequest? {
        guard var request = request else { return nil }
        headers.forEach { request.addValue($0.header.value, forHTTPHeaderField: $0.header.field) }
        request.httpMethod = HTTPMethods.get.rawValue
        do {
            let body = try JSONEncoder().encode(parameters)
            request.httpBody = body
        }
        catch {
            print(APIError.postParametersEncodingFalure(description: "\(error)").customDescription)
            return nil
        }
        
        
        return request
    }
    
    func postRequest<T: Encodable>(parameters: T, headers: [HTTPHeader]) -> URLRequest? {
        
        guard var request = request else { return nil }
        request.httpMethod = HTTPMethods.post.rawValue
        do {
            let body = try JSONEncoder().encode(parameters)
            request.httpBody = body
        } catch let error {
            print(APIError.postParametersEncodingFalure(description: "\(error)").customDescription)
            return nil
        }
        headers.forEach { request.addValue($0.header.value, forHTTPHeaderField: $0.header.field) }
        return request
        
    }
    
    
    
    func patchRequest<T: Encodable>(parameters: T, headers: [HTTPHeader]) -> URLRequest? {
        
        guard var request = request else { return nil }
        request.httpMethod = HTTPMethods.patch.rawValue
        do {
            let body = try JSONEncoder().encode(parameters)
            request.httpBody = body
        } catch let error {
            print(APIError.postParametersEncodingFalure(description: "\(error)").customDescription)
            return nil
        }
        headers.forEach { request.addValue($0.header.value, forHTTPHeaderField: $0.header.field) }
        return request
        
    }
    
}
