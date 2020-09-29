//
//  NSObjectProtocol+Additions.swift
//  AppStructure
//
//  Created by Fahid Attique on 18/01/2018.
//  Copyright © 2018 FahidAttique. All rights reserved.
//

import Foundation

extension NSObjectProtocol {

    static var identifier: String { return String(describing: self) }
}


extension NSObject{
    convenience init(jsonStr:String) {
        self.init()

        if let jsonData = jsonStr.data(using: String.Encoding.utf8, allowLossyConversion: false)
        {
            do {
                let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as! [String: AnyObject]

                // Loop
                for (key, value) in json {
                    let keyName = key as String
                    if let keyValue: String = value as? String {
                        self.setValue(keyValue, forKey: keyName)
                    }

                    // If property exists
//                    if (self.respondsToSelector(NSSelectorFromString(keyName))) {
                        
//                    }
                }

            } catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
            }
        }
        else
        {
            print("json is of wrong format!")
        }
    }
}
