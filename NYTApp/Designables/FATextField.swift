//
//  FATextField.swift
//  FanTazTech
//
//  Created by Guclu Media on 06/01/2018.
//  Copyright © 2018 none. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable

class FATextField: UITextField {
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }

    // MARK: Text Padding

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    static var padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: FATextField.padding)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: FATextField.padding)
        
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: FATextField.padding)
    }
    
    
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
    @IBInspectable var placeHolderFontSize: CGFloat {
        get {
            return self.placeHolderFontSize
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.font: UIFont.systemFont(ofSize: newValue)])
        }
    }
    
    @IBInspectable public var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        
        set {
            layer.cornerRadius = newValue
        }
    }
    @IBInspectable public var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        
        set {
            layer.borderWidth = newValue
        }
    }
    @IBInspectable public var borderColor: UIColor {
        get {
            return UIColor(cgColor: layer.borderColor ?? UIColor.clear.cgColor)
        }
        
        set {
            layer.borderColor = newValue.cgColor
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }

    
    
    @IBInspectable public var bottomInset: CGFloat {
        get { return FATextField.padding.bottom }
        set { FATextField.padding.bottom = newValue }
    }
    @IBInspectable public var leftInset: CGFloat {
        get { return FATextField.padding.left }
        set { FATextField.padding.left = newValue }
    }
    @IBInspectable public var rightInset: CGFloat {
        get { return FATextField.padding.right }
        set { FATextField.padding.right = newValue }
    }
    @IBInspectable public var topInset: CGFloat {
        get { return FATextField.padding.top }
        set { FATextField.padding.top = newValue }
    }
    
}









