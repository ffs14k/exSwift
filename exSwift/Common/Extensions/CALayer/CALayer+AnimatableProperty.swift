//
//  CALayer+AnimatableProperty.swift
//  exSwift
//
//  Created by Eugene on 20/01/2019.
//  Copyright © 2019 Eugene. All rights reserved.
//

import QuartzCore

extension CALayer {
    
    // Info at the and of file!
    
    enum CALayerAnimatableProperty {
        
        case anchorPoint
        case backgroundFilters
        case backgroundColor
        case borderColor
        case borderWidth
        case bounds
        case boundsOrigin
        case boundsOriginX
        case boundsOriginY
        case boundsSize
        case boundsWidth
        case boundsHeight
        case compositingFilter
        case contents
        case contentsRect
        case cornerRadius
        case filters
        case doubleSided
        case frame
        case hidden
        case mask
        case masksToBounds
        case opacity
        case position
        case positionX
        case positionY
        case rotationX
        case rotationY
        case rotationZ
        case scale
        case scaleX
        case scaleY
        case scaleZ
        case shadowColor
        case shadowOffset
        case shadowOpacity
        case shadowPath
        case shadowRadius
        case sublayers
        case sublayerTransform
        case translation
        case translationX
        case translationY
        case translationZ
        case transform
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


//    Links
//
//    https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/CoreAnimation_guide/Key-ValueCodingExtensions/Key-ValueCodingExtensions.html#//apple_ref/doc/uid/TP40004514-CH12-SW2
//
//    https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/CoreAnimation_guide/AnimatableProperties/AnimatableProperties.html
//
//    https://stackoverflow.com/questions/44230796/what-is-the-full-keypath-list-for-cabasicanimation
//
//    https://stackoverflow.com/questions/13913101/cabasicanimation-keys
//
//
//    Types:
//
//    anchorPoint: CGPoint
//    backgroundColor: CGColor?
//    backgroundFilters: [CIFilter]? (uses default CATransition, sub-properties of filters are animated using default CABasicAnimation)
//    borderColor: CGColor?
//    borderWidth: CGFloat
//    bounds: CGRect
//    compositingFilter: CIFilter? (uses default CATransition, sub-properties of filters are animated using default CABasicAnimation)
//    contents: CGImage?
//    contentsRect: CGRect
//    cornerRadius: CGFloat
//    doubleSided: Bool (no default animation)
//    filters: __[CIFilter]? (uses default CATransition, sub-properties of filters are animated using default CABasicAnimation)
//    frame: CGRect (!!not animatable!! use bounds and position)
//    hidden: Bool
//    mask: CALayer?
//    masksToBounds: Bool
//    opacity: Float (0 <= opacity <= 1)
//    shadowColor: CGColor?
//    shadowOffset: CGSize (default is (0,-3))
//    shadowOpacity: Float (0 <= shadowOpacity <= 1)
//    shadowPath: CGPath?
//    shadowRadius: CGFloat (default is 3)
//    sublayers: [CALayer]?
//    sublayerTransform: CATransform3D
//    transform: CATransform3D
//    zPosition: CGFloat
//
//    position - CGPoint
//    positionX; positionY - NSnumber, I suppose

//    rotation; rotation.x; rotation.y; rotation.z;
//    scale; scale.x; scale.y; scale.z
//    translation.x; translation.y - NSNumber
//
//    bounds - CGRect
//    boundsOrigin - CGpoint
//    boundsSize - CGSize
//    x, y, width, height  - NSNumber, I suppose
//
//    CALayer default implied CABasicAnimation**: duration = 0.25s or duration of current transaction.
//    CALayer default implied CATransition**: duration = 0.25s or duration of current transaction, type = kCATransitionFade, start progress = 0, end progress = 1




