//
//  LoadingIndicatorViewController.swift
//  exSwift
//
//  Created by Eugene on 16/12/2018.
//  Copyright © 2018 Eugene. All rights reserved.
//

import UIKit

enum FlatLoaderStyle {
    
    case small
    case regular
    
    var size: CGSize {
        switch self {
        case .small:        return CGSize(width: 20, height: 20)
        case .regular:      return CGSize(width: 40, height: 40)
        }
    }
    
    var circleWidth: CGFloat {
        switch self {
        case .small:        return 1
        case .regular:      return 2
        }
    }
    
}

enum GradientLoaderStyle {
    
    case small
    case regular
    
    var size: CGSize {
        switch self {
        case .small:        return CGSize(width: 20, height: 20)
        case .regular:      return CGSize(width: 40, height: 40)
        }
    }
    
    var circleWidth: CGFloat {
        switch self {
        case .small:        return 0.2
        case .regular:      return 0.8
        }
    }
    
}
