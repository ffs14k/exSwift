//
//  LoadingIndicatorViewController.swift
//  exSwift
//
//  Created by Eugene on 16/12/2018.
//  Copyright © 2018 Eugene. All rights reserved.
//

import QuartzCore

private let zRotationKey = "transform.rotation.z"

extension CALayer {
    
    func rotate360Degrees(duration: CFTimeInterval = 1) {
        return rotate360Degrees(duration: duration, timingFunction: CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear))
    }
    
    func rotate360Degrees(duration: CFTimeInterval = 1, timingFunction: CAMediaTimingFunction) {
        
        let rotateAnimation = CABasicAnimation(keyPath: zRotationKey)
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat.pi * 2
        rotateAnimation.duration = duration
        rotateAnimation.repeatCount = Float.infinity
        rotateAnimation.isRemovedOnCompletion = false
        rotateAnimation.timingFunction = timingFunction
        add(rotateAnimation, forKey: zRotationKey)
    }
    
    func remove360DegreesRotation() {
        removeAnimation(forKey: zRotationKey)
    }
    
    func isRotateAnimation360DegreesExsists() -> Bool {
        
        guard animation(forKey: zRotationKey) != nil else { return false }
        return true
    }
    
}
