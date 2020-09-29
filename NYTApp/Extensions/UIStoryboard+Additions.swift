//
//  UIStoryboard+Additions.swift
//  NYTApp
//
//  Created by Muhammad Azher on 29/09/2020.

import UIKit

extension UIStoryboard {

    
    // MARK: Class Properties
    
    class var main: UIStoryboard {
        return storyboard(loadWithName: "Main")
    }
    
    
    
    
    
    
    
    // MARK: Functions
    
    class func storyboard(loadWithName name: String) -> UIStoryboard {
        return UIStoryboard(name: name, bundle: Bundle.main)
    }
}
