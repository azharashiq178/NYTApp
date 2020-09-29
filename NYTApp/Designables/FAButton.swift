//
//  FAButton.swift
//  FanTazTech
//
//  Created by Guclu Media on 07/01/2018.
//  Copyright © 2018 none. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable

class FAButton: UIButton {
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBInspectable public var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        
        set {
            layer.cornerRadius = newValue
        }
    }
    @IBInspectable public var shouldRound: CGFloat {
        get {
            return layer.cornerRadius
        }
        
        set {
            if newValue != 0 {
                layer.cornerRadius = (UIScreen.main.bounds.height * newValue)/2
            }
            else {
                layer.cornerRadius = 0
            }
        }
    }
    
    @IBInspectable var HighlightedBackground: Bool {
        get {
            return true
        }
       set {
        layer.backgroundColor = UIColor.blue.cgColor
//            print("highlighted state")
        }
    }
    
    override var isEnabled: Bool {
        didSet {
            alpha = isEnabled ? 1 : 0.5
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
}



protocol CheckBoxButtonDelegate : class {
    func didSelectCheckBox(button:AACheckBoxButton)
}

class AACheckBoxButton : UIButton {
    
    weak var delegate : CheckBoxButtonDelegate?
    
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
    
    @IBInspectable public var isChecked: Bool {
        get {
            return self.isSelected
        }
        
        set {
            if newValue {
                self.setBackgroundImage(UIImage.init(named: "checkMark"), for: .normal)
            }
            else {
                self.setBackgroundImage(nil, for: .normal)
            }
            self.isSelected = newValue
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.addTarget(self, action: #selector(changeState(_:)), for: .touchUpInside)
    }
    
    @objc func changeState(_ sender : UIButton) {
        
        CATransaction.begin()
        CATransaction.setAnimationDuration(1)
        
        
        self.isChecked = !self.isChecked
        
        CATransaction.commit()
        self.tintColor = .clear
        
        delegate?.didSelectCheckBox(button: self)
    }
    
    
}
