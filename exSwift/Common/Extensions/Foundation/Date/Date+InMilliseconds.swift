//
//  Date+InMilliseconds.swift
//  exSwift
//
//  Created by Eugene on 10/02/2019.
//  Copyright © 2019 Eugene. All rights reserved.
//

import Foundation

extension Date {
    
    var inMilliseconds: Int {
        return Int(self.timeIntervalSince1970 * 1000)
    }
    
    static var nowInMilliseconds: Int {
        return Int(Date().timeIntervalSince1970 * 1000)
    }
    
    static func inMilliseconds(from date: Date) -> Int {
        return Int(date.timeIntervalSince1970 * 1000)
    }
    
    static func inMilliseconds(from date: String,
                               dateFormat: DateFormatter.FormatKey,
                               formatter: DateFormatter? = nil) -> Int? {
        
        let dateFormatter = formatter == nil ? DateFormatter() : formatter!
        dateFormatter.dateFormat = dateFormat.format
        
        guard let date = dateFormatter.date(from: date) else { return nil }
        
        return Int(date.timeIntervalSince1970 * 1000)
    }
    
    static func inMilliseconds(from date: String,
                               dateFormat: DateFormatter.FormatKey,
                               dateLocale: Locale.LocaleKey,
                               formatter: DateFormatter? = nil) -> Int? {
        
        let dateFormatter = formatter == nil ? DateFormatter() : formatter!
        dateFormatter.dateFormat = dateFormat.format
        dateFormatter.locale = Locale(identifier: dateLocale.identifier)
        
        guard let date = dateFormatter.date(from: date) else { return nil }
        
        return Int(date.timeIntervalSince1970 * 1000)
    }
    
}
