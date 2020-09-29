//
//  UserManager.swift
//  Adesys Alarm
//
//  Created by Ishak Guclu on 20/09/2019.
//  Copyright © 2019 Adesys. All rights reserved.
//

import Foundation
protocol UserProtocol: class {
    func isActivated() -> Bool
    func activateWithPin(_ pincode: String)
    func hasEnteredCorrectPincode(_ pincode: String) -> Bool
    func isLoggedIn() -> Bool
    func deactivateUser()

//    var keyChain: KeyChainHelper { get }
    var sharedDefault: RepositoryCacherProtocol { get }
    var objectCacher: RepositoryCacherProtocol { get }
}

class UserManager: UserProtocol {
//    var keyChain: KeyChainHelper = KeyChainHelperImpl()
    var sharedDefault: RepositoryCacherProtocol = SharedDefaults()
    var objectCacher: RepositoryCacherProtocol = ObjectCacher()
    
    func isActivated() -> Bool {
//        let key = keyChain.getString(key: CacheKeys.cPincodeKey)
//        let mail = keyChain.getString(key: CacheKeys.cEmailKey) ?? ""
//        let password = keyChain.getString(key: CacheKeys.cPasswordKey) ?? ""
//        return (key ?? "").count == 4 && !mail.isEmpty && !password.isEmpty
        return true
    }
    
    func activateWithPin(_ pincode: String) {
//        keyChain.setString(value: pincode, key: CacheKeys.cPincodeKey)
//        if let mail: String = objectCacher.get(key: .cEmailKey),
//            let password: String = objectCacher.get(key: .cPasswordKey) {
//            keyChain.setString(value: mail, key: .cEmailKey)
//            keyChain.setString(value: password, key: .cPasswordKey)
//        }
    }
    
    func deactivateUser() {
//        keyChain.clearAll()
//        sharedDefault.clearAll()
//        objectCacher.clearAll()
    }
    
    func hasEnteredCorrectPincode(_ pincode: String) -> Bool {
        return true
//        return keyChain.getString(key: .cPincodeKey) == pincode
    }

    func isLoggedIn() -> Bool {
        return true
//        return isActivated() && userManager.keyChain.containsNonNullKey(key: .cTokenKey)
//        return isActivated() && objectCacher.containsNonNullKey(key: .cTokenKey)
    }
}
