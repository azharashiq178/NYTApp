//
//  Result.swift
//  Adesys Alarm
//
//  Created by Ishak Guclu on 18/09/2019.
//  Copyright © 2019 Adesys. All rights reserved.
//

import Foundation
enum Result<T> {
    case success(T,Int)
    case failure(APIError,Int)
}

enum APIError: Error {
    
    case invalidData
    case jsonDecodingFailure
    case responseUnsuccessful(statusCode: String)
    case decodingTaskFailure(description: String)
    case requestFailed(description: String)
    case jsonConversionFailure(description: String)
    case postParametersEncodingFalure(description: String)
    case unknownIssue
    var customDescription: String {
        switch self {
        case .requestFailed(let description): return "Request Failed: \(description)"
        case .invalidData: return "Invalid Data"
        case .responseUnsuccessful(let statusCode): return "Response Unsuccessful status code -> \(statusCode)"
        case .jsonDecodingFailure: return "APIError - JSON decoding Failure"
        case .jsonConversionFailure(let description): return "APIError - JSON Conversion Failure -> \(description)"
        case .decodingTaskFailure(let description): return "APIError - decodingtask failure with error -> \(description)"
        case .postParametersEncodingFalure(let description): return "APIError - post parameters failure -> \(description)"
        case .unknownIssue: return "An unknown error has occured"
        }
    }
}
