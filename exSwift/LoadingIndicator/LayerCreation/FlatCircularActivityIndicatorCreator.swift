//
//  FlatCircularProgressLayerCreator.swift
//  exSwift
//
//  Created by Eugene on 21/01/2019.
//  Copyright © 2019 Eugene. All rights reserved.
//

//import QuartzCore
//
//final class FlatCircularActivityIndicatorCreator: ActivityIndicatorLayerCreator {
//    
//    // MARK: - Public methods
//    
//    func createActivityIndicator() -> CALayer {
//        
//        let path = UIBezierPath(arcCenter: loaderViewCenter, radius: loaderCircleRadius, startAngle: 0, endAngle: 2 * .pi, clockwise: true).cgPath
//        
//        setupGrapes(endAngle: 310, path: path)
//    }
//    
//    
//    // MARK: - Private methods
//    
//    private func setupGrapes(endAngle: CGFloat, path: CGPath) {
//        
//        let step: CGFloat = 2
//        var grapeAnimationDelay: CFTimeInterval = 0
//        
//        for i in stride(from: 0, to: endAngle, by: step) {
//            
//            let radians = i * .pi / 180
//            
//            let x = loaderViewCenter.x + loaderCircleRadius * cos(radians)
//            let y = loaderViewCenter.y + loaderCircleRadius * sin(radians)
//            
//            let grapeLayer = CAShapeLayer()
//            grapeLayer.frame = CGRect(x: 0, y: 0, width: circleWidth + 0.2, height: circleWidth + 0.2)
//            grapeLayer.position = CGPoint(x: x, y: y)
//            grapeLayer.cornerRadius = grapeLayer.frame.width / 2
//            grapeLayer.backgroundColor = loaderColor.cgColor
//            
//            grapeAnimationDelay += Double(rotateDuration * Double(step) / 360)
//            let rotateGrapeAnimation = CAKeyframeAnimation(keyPath: "position")
//            rotateGrapeAnimation.path = path
//            rotateGrapeAnimation.beginTime = grapeAnimationDelay
//            rotateGrapeAnimation.calculationMode = .linear
//            rotateGrapeAnimation.repeatCount = .infinity
//            rotateGrapeAnimation.isRemovedOnCompletion = false
//            rotateGrapeAnimation.duration = rotateDuration
//            
//            grapeLayer.add(rotateGrapeAnimation, forKey: nil)
//            
//            progressLayer.addSublayer(grapeLayer)
//        }
//        
//    }
//    
//}
