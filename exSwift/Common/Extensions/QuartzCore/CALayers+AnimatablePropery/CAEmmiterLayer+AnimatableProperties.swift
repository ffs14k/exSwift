//
//  CAEmmiterLayer+AnimatableProperties.swift
//  exSwift
//
//  Created by Eugene on 20/01/2019.
//  Copyright © 2019 Eugene. All rights reserved.
//

import QuartzCore

extension CAEmitterLayer {
    
    enum AnimatableProperty {
        
        case inherited(_ property: CALayer.CALayerAnimatableProperty)
        /// CGPoint
        case emitterPosition
        /// CGFloat
        case emitterZPosition
        /// CGSize
        case emitterSize
        
        var key: String {
            switch self {
            case .inherited(let property):  return property.key
            case .emitterPosition:          return "emitterPosition"
            case .emitterZPosition:         return "emitterZPosition"
            case .emitterSize:              return "emitterSize"
            }
        }
        
    }
    
}

