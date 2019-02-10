//
//  Locale+LocaleKey.swift
//  exSwift
//
//  Created by Eugene on 10/02/2019.
//  Copyright © 2019 Eugene. All rights reserved.
//

import Foundation

extension Locale {
    
    enum LocaleKey {
        
        case ru
        case en
        
        var identifier: String {
            switch self {
            case .ru: return "ru_RU"
            case .en: return "en_US"
            }
        }
        
    }
    
}
