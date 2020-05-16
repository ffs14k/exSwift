//
//  CALayer+AnimatableProperty.swift
//  exSwift
//
//  Created by Eugene on 20/01/2019.
//  Copyright © 2019 Eugene. All rights reserved.
//

import QuartzCore

extension CALayer {
    
    /**
     
     - references:
     
     [Apple. Key-Value Coding Extensions (CALayer examples)](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/CoreAnimation_guide/Key-ValueCodingExtensions/Key-ValueCodingExtensions.html#//apple_ref/doc/uid/TP40004514-CH12-SW2)
     
     [Apple. Animatable Properties.](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/CoreAnimation_guide/AnimatableProperties/AnimatableProperties.html)
     
     [Stack overflow 1](https://stackoverflow.com/questions/44230796/what-is-the-full-keypath-list-for-cabasicanimation)
     
     [Stack overflow 2](https://stackoverflow.com/questions/13913101/cabasicanimation-keys)
     
     */
    
    enum CALayerAnimatableProperty: String {
        
        /// CGPoint
        case anchorPoint = "anchorPoint"
        /// CGPoint
        case anchorPointZ = "anchorPointZ"
        /// CGColor?
        case backgroundColor = "backgroundColor"
        /// [CIFilter]? (uses default CATransition, sub-properties of filters are animated using default CABasicAnimation)
        case backgroundFilters = "backgroundFilters"
        /// CGColor?
        case borderColor = "borderColor"
        /// CGFloat
        case borderWidth = "borderWidth"
        /// CGRect
        case bounds = "bounds"
        /// CGpoint
        case boundsOrigin = "bounds.origin"
        /// CGFloat
        case boundsOriginX = "bounds.origin.x"
        /// CGFloat
        case boundsOriginY = "bounds.origin.y"
        /// CGSize
        case boundsSize = "bounds.size"
        /// CGFloat
        case boundsWidth = "bounds.size.width"
        /// CGFloat
        case boundsHeight = "bounds.size.height"
        /// CIFilter? (uses default CATransition, sub-properties of filters are animated using default CABasicAnimation)
        case compositingFilter = "compositingFilter"
        /// typically a CGImageRef, but may be something else
        case contents = "contents"
        /// CGRect
        case contentsRect = "contentsRect"
        /// CGFloat
        case contentsScale = "contentsScale"
        /// CGRect
        case contentsCenter = "contentsCenter"
        /// CGFloat
        case cornerRadius = "cornerRadius"
        /// Bool (no default animation)
        case doubleSided = "doubleSided"
        /// [CIFilter]? (uses default CATransition, sub-properties of filters are animated using default CABasicAnimation)
        case filters = "filters"
        /// CGRect (!!not animatable!! use bounds and position)
        case frame = "frame"
        /// Bool
        case hidden = "hidden"
        /// Bool
        case masksToBounds = "masksToBounds"
        /// Float
        case minificationFilterBias = "minificationFilterBias"
        /// Float (0 <= opacity <= 1)
        case opacity = "opacity"
        /// CGPoint
        case position = "position"
        /// CGFloat
        case positionX = "position.x"
        /// CGFloat
        case positionY = "position.y"
        /// CGFloat
        case rotationX = "transform.rotation.x"
        /// CGFloat
        case rotationY = "transform.rotation.y"
        /// CGFloat
        case rotationZ = "transform.rotation.z"
        /// CGFloat
        case scale = "transform.scale"
        /// CGFloat
        case scaleX = "transform.scale.x"
        /// CGFloat
        case scaleY = "transform.scale.y"
        /// CGFloat
        case scaleZ = "transform.scale.z"
        /// CGColor?
        case shadowColor = "shadowColor"
        /// CGSize (default is (0,-3))
        case shadowOffset = "shadowOffset"
        /// Float (0 <= shadowOpacity <= 1); default is 0
        case shadowOpacity = "shadowOpacity"
        /// CGpath?
        case shadowPath = "shadowPath"
        /// CGFloat (default is 3)
        case shadowRadius = "shadowRadius"
        /// [CALayer]?
        case sublayers = "sublayers"
        /// Bool
        case shouldRasterize = "shouldRasterize"
        /// CGFloat
        case rasterizationScale = "rasterizationScale"
        /// CATransform3D
        case sublayerTransform = "sublayerTransform"
        /// CGSize
        case translation = "transform.translation"
        /// CGFloat
        case translationX = "transform.translation.x"
        /// CGFloat
        case translationY = "transform.translation.y"
        /// CGFloat
        case translationZ = "transform.translation.z"
        /// CATransform3D
        case transform = "transform"
        /// CGFloat
        case zPosition = "zPosition"
    }

}




