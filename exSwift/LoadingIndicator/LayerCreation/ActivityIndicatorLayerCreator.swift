//
//  ActivityIndicatorLayerCreator.swift
//  exSwift
//
//  Created by Eugene on 21/01/2019.
//  Copyright © 2019 Eugene. All rights reserved.
//

import QuartzCore

protocol ActivityIndicatorLayerCreator: AnyObject {
    
    func createActivityIndicator() -> CALayer
}
