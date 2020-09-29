//
//  PharmaApis.swift
//  PharmaApp
//
//  Created by Muhammad Azher on 17/08/2020.
//  Copyright © 2020 None. All rights reserved.
//

import Foundation


enum NYTApis {
//    case devices
    case fetchNews
}

extension NYTApis: Endpoint {
    
    static var base: String {
        return "https://api.nytimes.com/"
    }

    var path: String {
        switch self {
        case .fetchNews: return "svc/topstories/v2/home.json?api-key=UvhOTglhm5DAAyKhyMzIZASwjBMYe6Yu"
        }
    }
}
