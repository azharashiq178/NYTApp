//
//  String+Additions.swift
//  FanTazTech
//
//  Created by Fahid Attique on 15/01/2018.
//  Copyright © 2018 Expertinsol. All rights reserved.
//


import Foundation
import UIKit

extension String {
    var length: Int {
        return self.count
//        return characters.count
        
    }
    
    mutating func removeFirstCharacter() -> Character {
        return remove(at: startIndex)
    }
    
    func characterAtIndex(_ index: Int) -> Character {
        
        return self[self.index(startIndex, offsetBy: index)]
    }
    
    mutating func insertCharacter(_ character: Character, atIndex index: Int) -> () {
        
        guard index < length else { return }
        
        insert(character, at: self.index(startIndex, offsetBy: 4))
    }
    
    func dateFromString(_ pattern:String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = pattern
        return dateFormatter.date(from: self)
    }
    
    
    
    var toPhoneNumberFormatted: String {
        get {
//            let numberString = "+" + self
//            let number = try? PhoneNumberKit().parse(numberString).numberString
//            return number ?? self
            if self.isEmpty {
                return "N/A"
            }
            return toPhoneNumberFormattedWithoutPhoneKit
        }
    }
    var toPhoneNumberFormattedWithoutPhoneKit: String {
        get {
            return "+" + self
        }
    }
    
    var toNumbersOnly: String {
        get {
            let number = self.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "+", with: "")
            return number
        }
    }
    
}





extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            let attrib = try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
            let myAttribute : [NSAttributedString.Key : Any] = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)]
            
            let str1 = NSMutableAttributedString.init(attributedString: attrib)
            let range: NSRange = str1.mutableString.range(of: attrib.string, options: .caseInsensitive)
            str1.addAttributes(myAttribute, range: range)
            return str1
            
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}




extension String {
    public var withoutHtml: String {
        guard let data = self.data(using: .utf8) else {
            return self
        }

        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]

        guard let attributedString = try? NSAttributedString(data: data, options: options, documentAttributes: nil) else {
            return self
        }

        return attributedString.string
    }
}
