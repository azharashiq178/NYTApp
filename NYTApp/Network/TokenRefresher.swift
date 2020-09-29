//
//  TokenRefresher.swift
//  Adesys Alarm
//
//  Created by Ishak Guclu on 10/10/2019.
//  Copyright © 2019 Adesys. All rights reserved.
//

import Foundation
class TokenRefresher {
    static func refreshTokenIfNeeded() {
        let dispatchGroup  = DispatchGroup()
        dispatchGroup.enter()
        
        refreshTokenIfNeeded { _ in
            dispatchGroup.leave()
        }
        dispatchGroup.wait()
    }
    
    static func refreshTokenIfNeeded(completion: @escaping ((Bool) -> Void)) {
//        func authenticate(completion: @escaping ((Bool) -> Void) ) {
//            AdesysAssembly.shared.apiService.authenticate { result in
//                switch result {
//                case.failure(let error, _):
//                    print(error.customDescription)
//                    completion(false)
//                case .success(let success,_):
//                    completion(success)
//                }
//            }
//        }
        
//        if let _: String = AdesysAssembly.shared.apiService.userManager.objectCacher.get(key: .cTokenKey) {
////            let expiration = JWTDecoder.getExpirationDateSince70(token: cachedToken)
////            let currentTime = Date().timeIntervalSince1970
////
////            let expirationTimeMargin: Double = 20 * 60 // 20 minutes
////            if expiration < (currentTime + expirationTimeMargin) {
////                authenticate(completion: completion)
////            } else {
////                completion(true)
////            }
//        } else {
//            authenticate(completion: completion)
//        }
    }
}
