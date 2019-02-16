//
//  CABasicAnimation+Animation.swift
//  exSwift
//
//  Created by Eugene on 20/01/2019.
//  Copyright © 2019 Eugene. All rights reserved.
//

import QuartzCore

extension CABasicAnimation {
    
    static func animation(for key: CAPropertyAnimation.Key, duration: Double) -> CABasicAnimation {
        
        let animation = CABasicAnimation(keyPath: key.keyPath)
        animation.duration = duration
        return animation
    }
    
    static func animation(for key: CAPropertyAnimation.Key, duration: Double, beginTime: Double) -> CABasicAnimation {
        
        let animation = CABasicAnimation(keyPath: key.keyPath)
        animation.duration = duration
        animation.beginTime = beginTime
        
        return animation
    }
    
}
