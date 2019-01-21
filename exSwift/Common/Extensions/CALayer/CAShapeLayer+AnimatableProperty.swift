//
//  CAShapeLayer+AnimatableProperty.swift
//  exSwift
//
//  Created by Eugene on 20/01/2019.
//  Copyright © 2019 Eugene. All rights reserved.
//

import QuartzCore

extension CAShapeLayer {
    
    enum AnimatableProperty {
        
        case inherited(_ property: CALayer.CALayerAnimatableProperty)
        /// CGColor?
        case fillColor
        /// [NSNumber]?
        case lineDashPhase
        /// CGFloat
        case lineWidth
        /// CGFloat
        case miterLimit
        /// CGColor?
        case strokeColor
        /// CGFloat
        case strokeStart
        /// CGFloat
        case strokeEnd
        
        var key: String {
            switch self {
            case .inherited(let property):  return property.key
            case .fillColor:                return "fillColor"
            case .lineDashPhase:            return "lineDashPhase"
            case .lineWidth:                return "lineWidth"
            case .miterLimit:               return "miterLimit"
            case .strokeColor:              return "strokeColor"
            case .strokeStart:              return "strokeStart"
            case .strokeEnd:                return "strokeEnd"
            }
        }
        
    }
    
}
