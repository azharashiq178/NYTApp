//
//  HTTPSetting.swift
//  Adesys Alarm
//
//  Created by Ishak Guclu on 18/09/2019.
//  Copyright © 2019 Adesys. All rights reserved.
//

import Foundation
enum HTTPHeader {
    
    case contentType(String)
    case accept(String)
    case authorization(String)
    case bearerAuthorization(String)
    
    var header: (field: String, value: String) {
        
        switch self {
        case .contentType(let value): return (field: "Content-Type", value: value)
        case .accept(let value): return (field: "Accept", value: value)
        case .authorization(let value): return (field: "Authorization", value: "\(value)")
        case .bearerAuthorization(let value): return (field: "Authorization", value: "Bearer \(value)")
        }
    }
}
enum HTTPMethods: String {
    
    case post = "POST"
    case get = "GET"
    case patch = "PATCH"
}
