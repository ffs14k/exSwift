//
//  Date+Day.swift
//  exSwift
//
//  Created by Eugene on 10/02/2019.
//  Copyright © 2019 Eugene. All rights reserved.
//

import Foundation

private let dayInSeconds = 86400

extension Date {
    
    static func day(_ formatKey: DateFormatter.FormatKey, addingDays: Int, formatter: DateFormatter?) -> String {
        
        let date = Date(timeIntervalSinceNow: TimeInterval(dayInSeconds * addingDays))
        
        let dateFormatter = formatter == nil ? DateFormatter() : formatter!
        dateFormatter.dateFormat = formatKey.format
        
        return dateFormatter.string(from: date)
    }
    
    static func day(_ formatKey: DateFormatter.FormatKey, addingDays: Int = 0) -> String {
        return Date.day(formatKey, addingDays: addingDays, formatter: nil)
    }
    
    static func localizedDay(_ locale: Locale.LocaleKey, formatKey: DateFormatter.FormatKey,
                             addingDays: Int, formatter: DateFormatter?) -> String {
        
        let date = Date(timeIntervalSinceNow: TimeInterval(dayInSeconds * addingDays))
        
        let dateFormatter = formatter == nil ? DateFormatter() : formatter!
        dateFormatter.dateFormat = formatKey.format
        dateFormatter.locale = Locale(identifier: locale.identifier)
        
        return dateFormatter.string(from: date)
    }
    
    static func localizedDay(_ locale: Locale.LocaleKey, formatKey: DateFormatter.FormatKey, addingDays: Int = 0) -> String {
        return Date.localizedDay(locale, formatKey: formatKey, addingDays: addingDays, formatter: nil)
    }
    
}
