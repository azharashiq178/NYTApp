//
//  ObjectCacher.swift
//  Adesys Alarm
//
//  Created by Ishak Guclu on 17/09/2019.
//  Copyright © 2019 Adesys. All rights reserved.
//

import Foundation
class ObjectCacher {
    var cache: [String: Any] = [:]
}

protocol RepositoryCacherProtocol: class {
    func put(key: CacheKeys, object: Any)
    func containsNonNullKey(key: CacheKeys) -> Bool
    func get<T>(key: CacheKeys) -> T?
    func clear(key: CacheKeys)
    func clearAll()
}



extension ObjectCacher: RepositoryCacherProtocol {
    func clearAll() {
        cache = [:]
    }
    
    public func put(key: CacheKeys, object: Any) {
        cache[key.rawValue] = object
    }
    
    func containsNonNullKey(key: CacheKeys) -> Bool {
        return cache[key.rawValue] != nil
    }
    
    func get<T>(key: CacheKeys) -> T? {
        return cache[key.rawValue] as? T
    }
    
    func clear(key: CacheKeys) {
        cache.removeValue(forKey: key.rawValue)
    }
}

class SharedDefaults {
    let defaults = UserDefaults.standard
}

extension SharedDefaults: RepositoryCacherProtocol {
    func clearAll() {
        let domain = Bundle.main.bundleIdentifier!
        defaults.removePersistentDomain(forName: domain)
        defaults.synchronize()
    }
    
    func clear(key: CacheKeys) {
        defaults.removeObject(forKey: key.rawValue)
    }
    
    func put(key: CacheKeys, object: Any) {
        defaults.set(object, forKey: key.rawValue)
        defaults.synchronize()
    }
    
    func containsNonNullKey(key: CacheKeys) -> Bool {
        return defaults.object(forKey: key.rawValue) != nil
    }
    
    func get<T>(key: CacheKeys) -> T? {
        
        return defaults.object(forKey: key.rawValue) as? T ?? nil
    }
}


enum CacheKeys: String {
    case cTokenKey = "TOKEN_KEY"
    case cRefreshTokenKey = "REFRESH_TOKEN_KEY"
    case cPincodeKey = "PINCODE_KEY"
    case cEmailKey = "EMAIL_KEY"
    case cPasswordKey = "PASSWORD_KEY"
    case cPinAttempts = "PINATTEMPTS_KEY"
    case cHasTouchIdEnabled = "HAS_TOUCH_ID_KEY"
    case cLocalNotificationsKey = "LOCAL_NOTIFICATION_KEY"
    case cwrongPinKey = "WRONG_PIN_KEY"
}
