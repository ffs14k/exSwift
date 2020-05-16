//
//  CAEmmiterLayer+AnimatableProperties.swift
//  exSwift
//
//  Created by Eugene on 20/01/2019.
//  Copyright © 2019 Eugene. All rights reserved.
//

import QuartzCore

extension CAEmitterLayer {
    
    enum AnimatableProperty: String {
        
        /// CGPoint
        case emitterPosition = "emitterPosition"
        /// CGFloat
        case emitterZPosition = "emitterZPosition"
        /// CGSize
        case emitterSize = "emitterSize"
    }
    
}

