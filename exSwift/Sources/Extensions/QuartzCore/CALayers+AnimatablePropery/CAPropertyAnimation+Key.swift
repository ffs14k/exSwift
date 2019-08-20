//
//  CAPropertyAnimation+Key.swift
//  exSwift
//
//  Created by Eugene on 20/01/2019.
//  Copyright © 2019 Eugene. All rights reserved.
//

import QuartzCore

extension CAPropertyAnimation {
    
    enum Key {
        
        case caLayer(_ property: CALayer.CALayerAnimatableProperty)
        case shapeLayer(_ property: CAShapeLayer.AnimatableProperty)
        case emmiterLayer(_ property: CAEmitterLayer.AnimatableProperty)
        case gradientLayer(_ property: CAGradientLayer.AnimatableProperty)
        case replicationLayer(_ property: CAReplicatorLayer.AnimatableProperty)
        case textLayer(_ property: CATextLayer.AnimatableProperty)
        
        var keyPath: String {
            switch self {
            case .caLayer(let property):           return property.rawValue
            case .shapeLayer(let property):        return property.key
            case .emmiterLayer(let property):      return property.key
            case .gradientLayer(let property):     return property.key
            case .replicationLayer(let property):  return property.key
            case .textLayer(let property):         return property.key
            }
        }
        
    }
    
}
