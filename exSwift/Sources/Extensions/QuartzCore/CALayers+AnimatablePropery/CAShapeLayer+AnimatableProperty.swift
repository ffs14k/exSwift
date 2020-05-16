//
//  CAShapeLayer+AnimatableProperty.swift
//  exSwift
//
//  Created by Eugene on 20/01/2019.
//  Copyright © 2019 Eugene. All rights reserved.
//

import QuartzCore

extension CAShapeLayer {
    
    enum AnimatableProperty: String {
        /// CGColor?
        case fillColor = "fillColor"
        /// [NSNumber]?
        case lineDashPhase = "lineDashPhase"
        /// CGFloat
        case lineWidth = "lineWidth"
        /// CGFloat
        case miterLimit = "miterLimit"
        /// CGColor?
        case strokeColor = "strokeColor"
        /// CGFloat
        case strokeStart = "strokeStart"
        /// CGFloat
        case strokeEnd = "strokeEnd"
    }
    
}
