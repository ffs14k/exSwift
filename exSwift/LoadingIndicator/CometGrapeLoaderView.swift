//
//  CometGrapeLoaderView.swift
//  exSwift
//
//  Created by Eugene on 17/12/2018.
//  Copyright © 2018 Eugene. All rights reserved.
//

import UIKit

private let defaultLoaderСolor = UIColor.black
private let appearanceDuration: TimeInterval = 0.15

private let endAngle: CGFloat = 310
private let rotateDuration: CFTimeInterval = 1
private let radiusScale: CGFloat = 0.85
private let radiusInset: CGFloat = 0


// Circular flat progress view
final class CometGrapeLoaderView: UIView, LoadingIndicator {
    
    // MARK: - Public properties
    
    var isAnimating: Bool {
        return alpha == 1 ? true : false
    }
    
    var loaderColor: UIColor = defaultLoaderСolor {
        didSet {
            redrawLoader()
        }
    }
    
    
    // MARK: - Subviews
    
    private let viewForProgressLayer = UIView()
    private var progressLayer: CALayer!
    
    
    // MARK: - Private Properties
    
    private let circleWidth: CGFloat
    private var loaderViewStyle: FlatLoaderStyle
    
    
    // MARK: - Init
    
    init(style: FlatLoaderStyle = .regular) {
        
        loaderViewStyle = style
        circleWidth = loaderViewStyle.circleWidth
        super.init(frame: .zero)
        drawSelf()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Consider creating CometLoaderView in code.")
    }
    
    
    // MARK: - Drawing
    
    private func drawSelf() {
        
        alpha = 0
        isHidden = true
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: loaderViewStyle.size.width).isActive = true
        heightAnchor.constraint(equalToConstant: loaderViewStyle.size.height).isActive = true
        
        viewForProgressLayer.backgroundColor = .clear
        addSubview(viewForProgressLayer)
    }
    
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        viewForProgressLayer.frame = bounds
        redrawLoader()
    }
    
    
    // MARK: - Public methods
    
    func start() {
        
        superview?.isUserInteractionEnabled = false
        superview?.bringSubviewToFront(self)
        isHidden = false
        redrawLoader()
        
        UIView.animate(withDuration: 0, delay: 0, options: [.beginFromCurrentState], animations: {
            self.alpha = 1
        }, completion: nil)
        
    }
    
    func stop() {
        
        UIView.animate(withDuration: appearanceDuration, delay: 0, options: [.beginFromCurrentState], animations: {
            self.alpha = 0
        }, completion: { _ in
            self.superview?.isUserInteractionEnabled = true
            self.superview?.sendSubviewToBack(self)
            self.isHidden = true
            self.resetLoader()
        })
    }
    
    
    // MARK: - Private methods
    
    private func drawLoaderCircle() {
        
        let path = UIBezierPath(arcCenter: loaderViewCenter, radius: loaderCircleRadius, startAngle: 0, endAngle: 2 * .pi, clockwise: true).cgPath
        
        setupGrapes(endAngle: 310, path: path)
    }
    
    private func setupGrapes(endAngle: CGFloat, path: CGPath) {
        
        let step: CGFloat = 2
        var grapeAnimationDelay: CFTimeInterval = 0
        
        for i in stride(from: 0, to: endAngle, by: step) {
            
            let radians = i * .pi / 180
            
            let x = loaderViewCenter.x + loaderCircleRadius * cos(radians)
            let y = loaderViewCenter.y + loaderCircleRadius * sin(radians)
            
            let grapeLayer = CAShapeLayer()
            grapeLayer.frame = CGRect(x: 0, y: 0, width: circleWidth + 0.2, height: circleWidth + 0.2)
            grapeLayer.position = CGPoint(x: x, y: y)
            grapeLayer.cornerRadius = grapeLayer.frame.width / 2
            grapeLayer.backgroundColor = loaderColor.cgColor
            
            grapeAnimationDelay += Double(rotateDuration * Double(step) / 360)
            let rotateGrapeAnimation = CAKeyframeAnimation(keyPath: "position")
            rotateGrapeAnimation.path = path
            rotateGrapeAnimation.beginTime = grapeAnimationDelay
            rotateGrapeAnimation.calculationMode = .linear
            rotateGrapeAnimation.repeatCount = .infinity
            rotateGrapeAnimation.isRemovedOnCompletion = false
            rotateGrapeAnimation.duration = rotateDuration
            
            grapeLayer.add(rotateGrapeAnimation, forKey: nil)
            
            progressLayer.addSublayer(grapeLayer)
        }
        
    }
    
    private func setupLoader() {
        
        progressLayer = CALayer()
        drawLoaderCircle()
        viewForProgressLayer.layer.addSublayer(progressLayer)
    }
    
    private func resetLoader() {
        
        guard let progressLayer = progressLayer else { return }
        
        progressLayer.removeFromSuperlayer()
        self.progressLayer = nil
    }
    
    private func redrawLoader() {
        
        if progressLayer != nil {
            resetLoader()
        }
        
        setupLoader()
    }
    
    
    // MARK: - Helpers
    
    private var loaderViewSize: CGSize {
        return loaderViewStyle.size
    }
    
    private var smallestEdge: CGFloat {
        return min(loaderViewSize.width, loaderViewSize.height)
    }
    
    private var loaderViewCenter: CGPoint {
        return CGPoint(x: loaderViewSize.width / 2, y: loaderViewSize.height / 2)
    }
    
    private var loaderCircleRadius: CGFloat {
        return (smallestEdge / 2 * radiusScale - radiusInset)
    }
    
}


