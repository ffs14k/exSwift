//
//  CATextLayer+AnimatableProperties.swift
//  exSwift
//
//  Created by Eugene on 20/01/2019.
//  Copyright © 2019 Eugene. All rights reserved.
//

import QuartzCore

extension CATextLayer {
    
    enum AnimatableProperty {
        
        case inherited(_ property: CALayer.CALayerAnimatableProperty)
        /// CGSize
        case fontSize
        /// CGColor?
        case foregroundColor

        
        var key: String {
            switch self {
            case .inherited(let property):  return property.key
            case .fontSize:                 return "fontSize"
            case .foregroundColor:          return "foregroundColor"
            }
        }
        
    }
    
}
