//
//  СircleActivityIndicatorType.swift
//  exSwift
//
//  Created by Eugene on 22/01/2019.
//  Copyright © 2019 Eugene. All rights reserved.
//

import CoreGraphics

enum СircleActivityIndicatorType {
    
    case custom(_ size: CGSize, circleWidth: CGFloat)
    case small
    case regular
    
    var size: CGSize {
        switch self {
        case .custom(let size, _): return size
        case .small:            return CGSize(width: 20, height: 20)
        case .regular:          return CGSize(width: 40, height: 40)
        }
    }
    
    var circleWidth: CGFloat {
        switch self {
        case .custom(_, let circleWidth): return circleWidth
        case .regular:                    return 2
        case .small:                      return 1
        }
    }
    
}
