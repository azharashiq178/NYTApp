//
//  FAWebView.swift
//  Hectagon
//
//  Created by Ali Shahid on 11/01/2019.
//  Copyright © 2019 Square63. All rights reserved.
//

import UIKit

//class FAWebView: UIWebView {
//
//    /*
//    // Only override draw() if you perform custom drawing.
//    // An empty implementation adversely affects performance during animation.
//    override func draw(_ rect: CGRect) {
//        // Drawing code
//    }
//    */
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
//    @IBInspectable public var cornerRadius: CGFloat {
//        get {
//            return layer.cornerRadius
//        }
//        
//        set {
//            layer.cornerRadius = newValue
//        }
//    }
//    @IBInspectable public var borderWidth: CGFloat {
//        get {
//            return layer.borderWidth
//        }
//        
//        set {
//            layer.borderWidth = newValue
//        }
//    }
//    @IBInspectable public var borderColor: UIColor {
//        get {
//            return UIColor(cgColor: layer.borderColor ?? UIColor.clear.cgColor)
//        }
//        
//        set {
//            layer.borderColor = newValue.cgColor
//        }
//    }
//    
//    @IBInspectable
//    var shadowRadius: CGFloat {
//        get {
//            return layer.shadowRadius
//        }
//        set {
//            layer.shadowRadius = newValue
//        }
//    }
//    
//    @IBInspectable
//    var shadowOpacity: Float {
//        get {
//            return layer.shadowOpacity
//        }
//        set {
//            layer.shadowOpacity = newValue
//        }
//    }
//    
//    @IBInspectable
//    var shadowOffset: CGSize {
//        get {
//            return layer.shadowOffset
//        }
//        set {
//            layer.shadowOffset = newValue
//        }
//    }
//    
//    @IBInspectable
//    var shadowColor: UIColor? {
//        get {
//            if let color = layer.shadowColor {
//                return UIColor(cgColor: color)
//            }
//            return nil
//        }
//        set {
//            if let color = newValue {
//                layer.shadowColor = color.cgColor
//            } else {
//                layer.shadowColor = nil
//            }
//        }
//    }
//
//}
