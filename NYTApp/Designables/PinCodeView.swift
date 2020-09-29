//
//  PinView.swift
//  Adesys Alarm
//
//  Created by Ishak Guclu on 19/09/2019.
//  Copyright © 2019 Adesys. All rights reserved.
//

import UIKit

@IBDesignable
class PinCodeView: UIControl, UIKeyInput {
    
    @IBInspectable var numberOfDigits: Int = 4 {
        didSet {
            setupViews()
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var spacing: CGFloat = 12 {
        didSet {
            pinsStack.spacing = spacing
            setupViews()
            layoutIfNeeded()
        }
    }
    
    // MARK: UIKeyInput Protocol Methods
    var hasText: Bool {
        return nextTag > 1 ? true : false
    }
    
    var pinString: String = ""
    
    func insertText(_ text: String) {
        
        if nextTag < (numberOfDigits + 1) {
            (viewWithTag(nextTag)! as? PINView)?.key = text
            nextTag += 1
            
            if nextTag == (numberOfDigits + 1) {
                //        resignFirstResponder()
                pinString = ""
                for index in 1..<nextTag {
                    pinString += (viewWithTag(index)! as? PINView)?.key ?? ""
                }
                sendActions(for: .editingDidEnd)
            }
        }
    }
    
    func fillPincode() {
        while nextTag < numberOfDigits + 1 {
            (viewWithTag(nextTag)! as? PINView)?.key = "A"
            nextTag += 1
        }
    }
    
    func deleteBackward() {
        if nextTag > 1 {
            nextTag -= 1
            (viewWithTag(nextTag)! as? PINView)?.key = ""
        }
    }
    
    func clear() {
        while nextTag > 1 {
            deleteBackward()
        }
    }
    
    // MARK: UITextInputTraits
    
    var keyboardType: UIKeyboardType = .numberPad
    
    // MARK: LKPINView Properties and Methods
    private var nextTag = 1
    private lazy var pinsStack: UIStackView = {
        
        let stackView = UIStackView.init()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.spacing = spacing
        
        return stackView
    }()
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubViewsToTheControl()
        setupViews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        addSubViewsToTheControl()
        setupViews()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        addSubViewsToTheControl()
        setupViews()
    }
    
    private func addSubViewsToTheControl() {
        backgroundColor = .clear
        addSubview(pinsStack)
    }
    
    private func setupViews() {
        
        for pinView in pinsStack.arrangedSubviews {
            pinView.removeFromSuperview()
        }
        
        for cons in constraints where cons.firstAttribute == .width {
            cons.isActive = false
        }
        
        layoutIfNeeded()
        
        for tag in 1...numberOfDigits {
            let pin = PINView.init(frame: .zero)
            pin.tag = tag
            pin.translatesAutoresizingMaskIntoConstraints = false
            pinsStack.addArrangedSubview(pin)
        }
        
        addConstraints([
            
            pinsStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            pinsStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            pinsStack.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.9, constant: 0),
            pinsStack.widthAnchor.constraint(equalTo: pinsStack.heightAnchor, multiplier: CGFloat(numberOfDigits), constant: (CGFloat(numberOfDigits - 1) * spacing))
            ])
        
        for pinnn in pinsStack.arrangedSubviews {
            
            guard let pin = pinnn as? PINView else {return}
            
            pinsStack.addConstraints([
                
                pin.heightAnchor.constraint(equalTo: pinsStack.heightAnchor, multiplier: 1),
                pin.widthAnchor.constraint(equalTo: pin.heightAnchor, constant: 0)
                
                ])
        }
    }
    
    // MARK: Helper class to generate pin views
    private class PINView: UIView {
        var key: String = "" {
            didSet {
                setupViews()
            }
        }
        
        var hasText: Bool {
            return key != ""
        }
        
        override var bounds: CGRect {
            didSet {
                setupViews()
            }
        }
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            setupViews()
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func setupViews() {
            
            layer.cornerRadius = self.bounds.height/2
            layer.masksToBounds = true
            layer.borderWidth = 1.0
            
            if hasText {
                layer.borderColor =  UIColor.black.cgColor
                backgroundColor = UIColor.lightGray
            } else {
                layer.borderColor = UIColor.lightGray.cgColor
                backgroundColor = .white
            }
            
        }
        
    }
    
}
