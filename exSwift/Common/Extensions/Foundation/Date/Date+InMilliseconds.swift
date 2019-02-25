//
//  Date+InMilliseconds.swift
//  exSwift
//
//  Created by Eugene on 10/02/2019.
//  Copyright © 2019 Eugene. All rights reserved.
//

import Foundation

extension Date {
    
    var inMilliseconds: Int64 {
        return Int64(self.timeIntervalSince1970 * 1000)
    }
    
    static func inMilliseconds(from date: Date) -> Int64 {
        return Int64(date.timeIntervalSince1970 * 1000)
    }
    
    static var nowInMilliseconds: Int64 {
        return Int64(Date().timeIntervalSince1970 * 1000)
    }
    
    static func inMilliseconds(from date: String,
                               dateFormat: DateFormatter.FormatKey,
                               formatter: DateFormatter? = nil) -> Int64? {
        
        let dateFormatter = formatter == nil ? DateFormatter() : formatter!
        dateFormatter.dateFormat = dateFormat.format
        
        guard let date = dateFormatter.date(from: date) else { return nil }
        
        return date.inMilliseconds
    }
    
    static func inMilliseconds(from date: String,
                               dateFormat: DateFormatter.FormatKey,
                               dateLocale: Locale.LocaleKey,
                               formatter: DateFormatter? = nil) -> Int64? {
        
        let dateFormatter = formatter == nil ? DateFormatter() : formatter!
        dateFormatter.dateFormat = dateFormat.format
        dateFormatter.locale = Locale(identifier: dateLocale.identifier)
        
        guard let date = dateFormatter.date(from: date) else { return nil }
        
        return date.inMilliseconds
    }
    
}
