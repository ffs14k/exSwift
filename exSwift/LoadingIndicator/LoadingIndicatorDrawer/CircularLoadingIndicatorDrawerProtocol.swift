//
//  CircularLoadingIndicatorDrawer.swift
//  exSwift
//
//  Created by Eugene on 22/01/2019.
//  Copyright © 2019 Eugene. All rights reserved.
//

import QuartzCore

protocol CircularActivityIndicatorDrawerProtocol: ActivityIndicatorDrawerProtocol {
    
    var circleWidth: CGFloat { get set }
    var circleColor: CGColor { get set }
    var rotateDuration: CFTimeInterval { get set }
}

