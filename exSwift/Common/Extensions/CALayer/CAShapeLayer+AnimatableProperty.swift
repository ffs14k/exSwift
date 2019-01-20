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
        case fillColor
        case lineDashPhase
        case lineWidth
        case miterLimit
        case strokeColor
        case strokeStart
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
