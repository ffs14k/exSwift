//
//  CAReplicatorLayer+AnimatableProperty.swift
//  exSwift
//
//  Created by Eugene on 20/01/2019.
//  Copyright © 2019 Eugene. All rights reserved.
//

import QuartzCore

extension CAReplicatorLayer {
    
    enum AnimatableProperty: String {
        
        /// CFTimeInterval (Double)
        case instanceDelay = "instanceDelay"
        /// CATransform3D
        case instanceTransform = "instanceTransform"
        /// Float
        case instanceRedOffset = "instanceRedOffset"
        /// Float
        case instanceGreenOffset = "instanceGreenOffset"
        /// Float
        case instanceBlueOffset = "instanceBlueOffset"
        /// Float
        case instanceAlphaOffset = "instanceAlphaOffset"
    }
    
}
