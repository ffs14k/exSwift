//
//  LoadingIndicatorDrawer.swift
//  exSwift
//
//  Created by Eugene on 21/01/2019.
//  Copyright © 2019 Eugene. All rights reserved.
//

import QuartzCore

protocol ActivityIndicatorDrawerProtocol {
    
    var size: CGSize { get }
    var backgroundColor: CGColor { get set }
    
    func createActivityIndicator() -> CALayer
}


extension ActivityIndicatorDrawerProtocol {
    
    var smallestEdge: CGFloat {
        return min(size.width, size.height)
    }
    
    var loaderViewCenter: CGPoint {
        return CGPoint(x: size.width / 2, y: size.height / 2)
    }
    
}
