//
//  CAGradientLayer+AnimatableProperty.swift
//  exSwift
//
//  Created by Eugene on 20/01/2019.
//  Copyright © 2019 Eugene. All rights reserved.
//

import QuartzCore

extension CAGradientLayer {
    
    enum AnimatableProperty: String {
        
        /// [CGColor]? ([Any]? by Apple docs, but CGColor works as well)
        case colors = "colors"
        /// [NSNuber]?
        case locations = "locations"
        /// CGPoint
        case endPoint = "endPoint"
        /// CGPoint
        case startPoint = "startPoint"
    }
    
}
