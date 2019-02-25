//
//  CircularLoadingIndicatorDrawer.swift
//  exSwift
//
//  Created by Eugene on 22/01/2019.
//  Copyright © 2019 Eugene. All rights reserved.
//

import UIKit

struct CircularActivityIndicatorDrawer: CircularActivityIndicatorDrawerProtocol {
    
    var circleWidth: CGFloat
    var circleColor: CGColor
    var rotateDuration: CFTimeInterval
    var size: CGSize
    var backgroundColor: CGColor
    
    init(size: CGSize, backgroundColor: CGColor,
         circleWidth: CGFloat,  circleColor: CGColor, rotateDuration: CFTimeInterval) {
        
        self.size = size
        self.backgroundColor = backgroundColor
        self.circleWidth = circleWidth
        self.circleColor = circleColor
        self.rotateDuration = rotateDuration
    }
    
    
    // MARK: - Public methods
    
    func createActivityIndicator() -> CALayer {
        
        let path = UIBezierPath(arcCenter: loaderViewCenter, radius: loaderCircleRadius,
                                startAngle: 0, endAngle: 2 * .pi, clockwise: true).cgPath
        
        
        let activityIndicatorLayer = setupGrapes(endAngle: 310, path: path)
        
        return activityIndicatorLayer
    }
    
    
    // MARK: - Private methods
    
    private func setupGrapes(endAngle: CGFloat, path: CGPath) -> CALayer {
        
        let endAngle: CGFloat = 310
        let step: CGFloat = 2
        var grapeAnimationDelay: CFTimeInterval = 0
        
        let activityIndicatorLayer = CALayer()
        
        for i in stride(from: 0, to: endAngle, by: step) {
            
            let radians = i * .pi / 180
            
            let x = loaderViewCenter.x + loaderCircleRadius * cos(radians)
            let y = loaderViewCenter.y + loaderCircleRadius * sin(radians)
            
            let grapeLayer = CAShapeLayer()
            grapeLayer.frame = CGRect(x: 0, y: 0, width: circleWidth + 0.2, height: circleWidth + 0.2)
            grapeLayer.position = CGPoint(x: x, y: y)
            grapeLayer.cornerRadius = grapeLayer.frame.width / 2
            grapeLayer.backgroundColor = circleColor
            
            grapeAnimationDelay += Double(rotateDuration * Double(step) / 360)
            
            let rotateGrapeAnimation = CAKeyframeAnimation(.caLayer(.position),
                                                           duration: rotateDuration,
                                                           beginTime: grapeAnimationDelay)
            rotateGrapeAnimation.path = path
            rotateGrapeAnimation.calculationMode = .linear
            rotateGrapeAnimation.repeatCount = .infinity
            rotateGrapeAnimation.isRemovedOnCompletion = false
            
            grapeLayer.add(rotateGrapeAnimation, forKey: nil)
            
            activityIndicatorLayer.addSublayer(grapeLayer)
        }
        
        return activityIndicatorLayer
    }
    
    
    // MARK: - Helpers
    
    private var loaderCircleRadius: CGFloat {
        return (smallestEdge / 2)
        //        return (smallestEdge / 2 * radiusScale - radiusInset)
    }
    
}

