//
//  UITextField+Additions.swift
//  FanTazTech
//
//  Created by Fahid Attique on 10/01/2018.
//  Copyright © 2018 Expertinsol. All rights reserved.
//

import Foundation
import UIKit

extension UITextField{
 
    // MARK: Public Methods
    
    func isValid() -> Bool {
        
        if (text?.isEmpty == true) {
            return false
        }
        
//        if (self.keyboardType == .emailAddress) {
//            return isEmail(self.text)
//        }
        
        return true
    }
}
