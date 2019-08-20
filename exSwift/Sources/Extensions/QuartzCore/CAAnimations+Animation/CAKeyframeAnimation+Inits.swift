//
//  CAKeyframeAnimation+Inits.swift
//  exSwift
//
//  Created by Eugene on 25/02/2019.
//  Copyright © 2019 Eugene. All rights reserved.
//

import QuartzCore

extension CAKeyframeAnimation {
    
    convenience init(_ key: CAPropertyAnimation.Key, duration: Double) {
        self.init(keyPath: key.keyPath)
        self.duration = duration
    }
    
    convenience init(_ key: CAPropertyAnimation.Key, duration: Double, beginTime: Double) {
        self.init(keyPath: key.keyPath)
        self.duration = duration
        self.beginTime = beginTime
    }
    
}
