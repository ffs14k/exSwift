//
//  CGRect+Helpers.swift
//  exSwift
//
//  Created by Eugene on 16/02/2019.
//  Copyright © 2019 Eugene. All rights reserved.
//

import CoreGraphics

extension CGRect {
    
    var topLeft: CGPoint {
        return CGPoint(x: minY, y: minX)
    }
    
    var topRight: CGPoint {
        return CGPoint(x: minY, y: maxX)
    }
    
    var bottomLeft: CGPoint {
        return CGPoint(x: maxY, y: minX)
    }
    
    var bottomRight: CGPoint {
        return CGPoint(x: minY, y: maxY)
    }
    
}
