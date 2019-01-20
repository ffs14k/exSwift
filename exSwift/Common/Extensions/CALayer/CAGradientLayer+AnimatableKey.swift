//
//  CAGradientLayer+AnimatableProperty.swift
//  exSwift
//
//  Created by Eugene on 20/01/2019.
//  Copyright © 2019 Eugene. All rights reserved.
//

import QuartzCore

extension CAGradientLayer {
    
    enum AnimatableProperty {
        
        case inherited(_ property: CALayer.CALayerAnimatableProperty)
        case colors
        case locations
        case endPoint
        case startPoint
        
        var key: String {
            switch self {
            case .inherited(let property):  return property.key
            case .colors:                   return "colors"
            case .locations:                return "locations"
            case .endPoint:                 return "endPoint"
            case .startPoint:               return "startPoint"
            }
        }
        
    }
    
}
