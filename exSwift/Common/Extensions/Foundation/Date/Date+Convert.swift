//
//  Date+Convert.swift
//  exSwift
//
//  Created by Eugene on 10/02/2019.
//  Copyright © 2019 Eugene. All rights reserved.
//

import Foundation

extension Date {
    
    static func convert(_ date: String,
                        inFormat: DateFormatter.FormatKey,
                        toFormat: DateFormatter.FormatKey,
                        formatter: DateFormatter? = nil) -> String? {
        
        let dateFormatter: DateFormatter
        
        if let formatter = formatter {
            dateFormatter = formatter
        } else {
            dateFormatter = DateFormatter()
        }
        
        dateFormatter.dateFormat = inFormat.format
        guard let formattedDate = dateFormatter.date(from: date) else { return nil }
        dateFormatter.dateFormat = toFormat.format
        
        return dateFormatter.string(from: formattedDate)
    }
    
    
    static func convert(_ date: String,
                        inFormat: DateFormatter.FormatKey,
                        toFormat: DateFormatter.FormatKey,
                        locale: Locale.LocaleKey,
                        formatter: DateFormatter? = nil) -> String? {
        
        let dateFormatter: DateFormatter
        
        if let formatter = formatter {
            dateFormatter = formatter
        } else {
            dateFormatter = DateFormatter()
        }
        
        dateFormatter.dateFormat = inFormat.format
        dateFormatter.locale = Locale(identifier: locale.identifier)
        guard let formattedDate = dateFormatter.date(from: date) else { return nil }
        dateFormatter.dateFormat = toFormat.format
        
        return dateFormatter.string(from: formattedDate)
    }
    
}
