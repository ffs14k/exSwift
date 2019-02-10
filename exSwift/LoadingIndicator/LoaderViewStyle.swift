//
//  LoadingIndicatorStyle.swift
//  exSwift
//
//  Created by Eugene on 16/12/2018.
//  Copyright © 2018 Eugene. All rights reserved.
//

import UIKit

private let defaultBackgroundColor: CGColor = UIColor.clear.cgColor
private let defaultCircleColor: CGColor = UIColor.black.cgColor
private let defaultRotateDuration: CFTimeInterval = 1

enum CircularActivityIndicatorStyle {
    
    case flat(type: СircleActivityIndicatorType)
    
    var drawer: CircularActivityIndicatorDrawerProtocol {
        
        switch self {
            
        case .flat(let type):
            
            let drawer = CircularActivityIndicatorDrawer(size: type.size, backgroundColor: defaultBackgroundColor,
                                                         circleWidth: type.circleWidth, circleColor: defaultCircleColor,
                                                         rotateDuration: defaultRotateDuration)
            
            return drawer
        }
        
    }
    
}
