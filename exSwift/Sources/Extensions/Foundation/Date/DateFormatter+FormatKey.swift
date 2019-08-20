//
//  Date+FormatKey.swift
//  exSwift
//
//  Created by Eugene on 10/02/2019.
//  Copyright © 2019 Eugene. All rights reserved.
//

import Foundation

extension DateFormatter {
    
    enum FormatKey {
        
        case HHmm
        case dayName
        case MMM_d
        case yyyy
        case yyyyMMdd_T_000000
        case yyyyMMdd_T_235959
        case yyyyMMdd_T_HHmmss

        
        var format: String {
            switch self {
            case .HHmm:              return "HH:mm"
            case .dayName:           return "EEEE"
            case .MMM_d:             return "MMM d"  // Feb 1
            case .yyyy:              return "yyyy"   // 2038
            case .yyyyMMdd_T_000000: return "yyyy-MM-dd'T'00:00:00"
            case .yyyyMMdd_T_235959: return "yyyy-MM-dd'T'23:59:59"
            case .yyyyMMdd_T_HHmmss: return "yyyy-MM-dd'T'HH:mm:ss"
            }
        }
        
    }
    
}
