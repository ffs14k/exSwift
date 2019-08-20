//
//  CAReplicatorLayer+AnimatableProperty.swift
//  exSwift
//
//  Created by Eugene on 20/01/2019.
//  Copyright © 2019 Eugene. All rights reserved.
//

import QuartzCore

extension CAReplicatorLayer {
    
    enum AnimatableProperty {
        
        case inherited(_ property: CALayer.CALayerAnimatableProperty)
        /// CFTimeInterval (Double)
        case instanceDelay
        /// CATransform3D
        case instanceTransform
        /// Float
        case instanceRedOffset
        /// Float
        case instanceGreenOffset
        /// Float
        case instanceBlueOffset
        /// Float
        case instanceAlphaOffset
        
        var key: String {
            switch self {
            case .inherited(let property):  return property.rawValue
            case .instanceDelay:            return "instanceDelay"
            case .instanceTransform:        return "instanceTransform"
            case .instanceRedOffset:        return "instanceRedOffset"
            case .instanceGreenOffset:      return "instanceGreenOffset"
            case .instanceBlueOffset:       return "instanceBlueOffset"
            case .instanceAlphaOffset:      return "instanceAlphaOffset"
            }
        }
        
    }
    
}
