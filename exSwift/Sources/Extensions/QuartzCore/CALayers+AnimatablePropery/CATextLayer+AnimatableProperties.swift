//
//  CATextLayer+AnimatableProperties.swift
//  exSwift
//
//  Created by Eugene on 20/01/2019.
//  Copyright © 2019 Eugene. All rights reserved.
//

import QuartzCore

extension CATextLayer {
    
    enum AnimatableProperty: String {
        
        /// CGSize
        case fontSize = "fontSize"
        /// CGColor?
        case foregroundColor = "foregroundColor"
    }
    
}
