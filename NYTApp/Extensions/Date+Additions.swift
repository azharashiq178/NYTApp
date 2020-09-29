//
//  Date+Additions.swift
//  FanTazTech
//
//  Created by Fahid Attique on 28/01/2018.
//  Copyright © 2018 Expertinsol. All rights reserved.
//

import Foundation

extension Date {
    
    static var timeStampInMillis: Int64 {
        return Int64(Date().timeIntervalSince1970)
    }

    static var timeStampInMillisString: String {
        return String(timeStampInMillis)
    }
    func stringFromDate(_ pattern:String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = pattern
        return dateFormatter.string(from: self)
    }

    func toString(of pattern: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = pattern
        return dateFormatter.string(from: self)
    }
    func nextMonth() -> Date? {
        return Calendar.current.date(byAdding: .month, value: 1, to: self)
    }
    func previousMonth() -> Date? {
        return Calendar.current.date(byAdding: .month, value: -1, to: self)
    }
    
    func getYear() -> String
    {
        let year = Calendar.current.component(.year, from: self)
        
        return String(format: "\(year)")
    }
    
    func getMonth() -> String
    {
        let month = Calendar.current.component(.month, from: self)
        
        return String(format: "\(month)")
    }
    
    func compareDate(compareDate:Date) -> Bool {
        let order = Calendar.current.compare(self, to: compareDate, toGranularity: .day)
        switch order {
        case .orderedSame:
            return true
        default:
            return false
        }
    }
    
    func getMonthAndYear() -> String {
        
        let year = Calendar.current.component(.year, from: self)
        
        return String(format: "\(self.getMonthName()) \(year)")
    }
    
    func getMonthName() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        let strMonth = dateFormatter.string(from: self)
        return strMonth
    }
}

public func ==(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs === rhs || lhs.compare(rhs as Date) == .orderedSame
}

public func <(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.compare(rhs as Date) == .orderedAscending
}

public func >(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.compare(rhs as Date) == .orderedDescending
}

extension NSDate: Comparable { }
