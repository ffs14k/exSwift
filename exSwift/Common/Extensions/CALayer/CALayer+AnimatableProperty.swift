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
     
     [Apple. Key-Value Coding Extensions](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/CoreAnimation_guide/Key-ValueCodingExtensions/Key-ValueCodingExtensions.html#//apple_ref/doc/uid/TP40004514-CH12-SW2)
     
     [Apple. Animatable Properties.](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/CoreAnimation_guide/AnimatableProperties/AnimatableProperties.html)
     
     [Stack overflow 1](https://stackoverflow.com/questions/44230796/what-is-the-full-keypath-list-for-cabasicanimation)
     
     [Stack overflow 2](https://stackoverflow.com/questions/13913101/cabasicanimation-keys)
     
    */
    
    enum CALayerAnimatableProperty {
        
        /// CGPoint
        case anchorPoint
        /// CGColor?
        case backgroundColor
        /// [CIFilter]? (uses default CATransition, sub-properties of filters are animated using default CABasicAnimation)
        case backgroundFilters
        /// CGColor?
        case borderColor
        /// CGFloat
        case borderWidth
        /// CGRect
        case bounds
        /// CGpoint
        case boundsOrigin
        /// CGFloat
        case boundsOriginX
        /// CGFloat
        case boundsOriginY
        /// CGSize
        case boundsSize
        /// CGFloat
        case boundsWidth
        /// CGFloat
        case boundsHeight
        /// CIFilter? (uses default CATransition, sub-properties of filters are animated using default CABasicAnimation)
        case compositingFilter
        /// CGImage?
        case contents
        /// CGRect
        case contentsRect
        /// CGFloat
        case cornerRadius
        /// Bool (no default animation)
        case doubleSided
        /// [CIFilter]? (uses default CATransition, sub-properties of filters are animated using default CABasicAnimation)
        case filters
        /// CGRect (!!not animatable!! use bounds and position)
        case frame
        /// Bool
        case hidden
        /// CALayer?
        case mask
        /// Bool
        case masksToBounds
        /// Float (0 <= opacity <= 1)
        case opacity
        /// CGPoint
        case position
        /// CGFloat
        case positionX
        /// CGFloat
        case positionY
        /// CGFloat
        case rotationX
        /// CGFloat
        case rotationY
        /// CGFloat
        case rotationZ
        /// CGFloat
        case scale
        /// CGFloat
        case scaleX
        /// CGFloat
        case scaleY
        /// CGFloat
        case scaleZ
        /// CGColor?
        case shadowColor
        /// CGSize (default is (0,-3))
        case shadowOffset
        /// Float (0 <= shadowOpacity <= 1)
        case shadowOpacity
        /// CGpath?
        case shadowPath
        /// CGFloat (default is 3)
        case shadowRadius
        /// [CALayer]?
        case sublayers
        /// CATransform3D
        case sublayerTransform
        /// CGSize
        case translation
        /// CGFloat
        case translationX
        /// CGFloat
        case translationY
        /// CGFloat
        case translationZ
        /// CATransform3D
        case transform
        /// CGFloat
        case zPosition
        
        var key: String {
            switch self {
            case .anchorPoint:          return "anchorPoint"
            case .backgroundFilters:    return "backgroundFilters"
            case .backgroundColor:      return "backgroundColor"
            case .borderColor:          return "borderColor"
            case .borderWidth:          return "borderWidth"
            case .bounds:               return "bounds"
            case .boundsOrigin:         return "bounds.origin"
            case .boundsOriginX:        return "bounds.origin.x"
            case .boundsOriginY:        return "bounds.origin.y"
            case .boundsSize:           return "bounds.size"
            case .boundsWidth:          return "bounds.size.width"
            case .boundsHeight:         return "bounds.size.height"
            case .compositingFilter:    return "compositingFilter"
            case .contents:             return "contents"
            case .contentsRect:         return "contentsRect"
            case .cornerRadius:         return "cornerRadius"
            case .filters:              return "filters"
            case .doubleSided:          return "doubleSided"
            case .frame:                return "frame"
            case .hidden:               return "hidden"
            case .mask:                 return "mask"
            case .masksToBounds:        return "masksToBounds"
            case .opacity:              return "opacity"
            case .position:             return "position"
            case .positionX:            return "position.x"
            case .positionY:            return "position.y"
            case .rotationX:            return "transform.rotation.x"
            case .rotationY:            return "transform.rotation.y"
            case .rotationZ:            return "transform.rotation.z"
            case .scale:                return "transform.scale"
            case .scaleX:               return "transform.scale.x"
            case .scaleY:               return "transform.scale.x"
            case .scaleZ:               return "transform.scale.x"
            case .shadowColor:          return "shadowColor"
            case .shadowOffset:         return "shadowOffset"
            case .shadowOpacity:        return "shadowOpacity"
            case .shadowPath:           return "shadowPath"
            case .shadowRadius:         return "shadowRadius"
            case .sublayers:            return "sublayers"
            case .sublayerTransform:    return "sublayerTransform"
            case .translation:          return "transform.translation"
            case .translationX:         return "transform.translation.x"
            case .translationY:         return "transform.translation.y"
            case .translationZ:         return "transform.translation.z"
            case .transform:            return "transform"
            case .zPosition:            return "zPosition"
            }
        }
        
    }
    
}




