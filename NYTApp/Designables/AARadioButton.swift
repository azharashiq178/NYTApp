////
////  AARadioButton.swift
////  Yaap
////
////  Created by Guclu Media on 04/04/2020.
////  Copyright © 2020 None. All rights reserved.
////
//
//import Foundation
//import DLRadioButton
//
//@IBDesignable
//
//class AARadioButton: DLRadioButton {
//    
//    var selectedBackgroundColor : UIColor = UIColor.blue
//    var unSelectedBackgroundColor : UIColor = UIColor.clear
//    var isButtonSelected = false
//    
//    
//    override func prepareForInterfaceBuilder() {
//        super.prepareForInterfaceBuilder()
////        setBackgroundColorWithState()
//        addTarget(self, action: #selector(changeState(_:)), for: .touchDown)
////        self.addObserver(self, forKeyPath: #keyPath(UIButton.isSelected), options: .new, context: nil)
//    }
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
////        setBackgroundColorWithState()
//        addTarget(self, action: #selector(changeState(_:)), for: .touchDown)
//        
//        
////        self.addObserver(self, forKeyPath: #keyPath(UIButton.isSelected), options: .new, context: nil)
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
////        setBackgroundColorWithState()
//        addTarget(self, action: #selector(changeState(_:)), for: .touchDown)
//        
////        self.addObserver(self, forKeyPath: #keyPath(UIButton.isSelected), options: .new, context: nil)
//        
//    }
//    
//    
//    @objc func changeState(_ sender : UIButton) {
//        
//        isButtonSelected = !isButtonSelected
//        self.isSelected = isButtonSelected
//        setBackgroundColorWithState()
//        print(isSelected)
//        
//    }
//    
//    
//    @IBInspectable public var cornerRadius: CGFloat {
//        get {
//            return layer.cornerRadius
//        }
//        
//        set {
//            layer.cornerRadius = newValue
//        }
//    }
//    @IBInspectable public var shouldRound: CGFloat {
//        get {
//            return layer.cornerRadius
//        }
//        
//        set {
//            if newValue != 0 {
//                layer.cornerRadius = (UIScreen.main.bounds.height * newValue)/2
//            }
//            else {
//                layer.cornerRadius = 0
//            }
//        }
//    }
//    
//    @IBInspectable var HighlightedBackground: Bool {
//        get {
//            return true
//        }
//       set {
//        layer.backgroundColor = UIColor.blue.cgColor
////            print("highlighted state")
//        }
//    }
//    
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
//    
//    @IBInspectable var SelectedBackgroundColor: UIColor {
//            get {
//                return selectedBackgroundColor
//            }
//           set {
//            selectedBackgroundColor = newValue
//            setBackgroundColorWithState()
//    //            print("highlighted state")
//            }
//        }
//    
//    func setBackgroundColorWithState() {
//        if isSelected {
//            self.backgroundColor = selectedBackgroundColor
//        }
//        else {
//            self.backgroundColor = unSelectedBackgroundColor
//        }
////        switch self.state {
////        case .selected:
////            self.backgroundColor = selectedBackgroundColor
////            break
////        case .normal:
////            self.backgroundColor = unSelectedBackgroundColor
////            break
////        default:
////            self.backgroundColor = unSelectedBackgroundColor
////        }
//    }
//    
//    
////    override class func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
////        print(keyPath)
////    }
//    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
//        
//        if keyPath == #keyPath(UIButton.isSelected) {
////            self.isSelected = !self.isSelected
//            setBackgroundColorWithState()
//            print(isSelected)
//        }
//    }
//}
