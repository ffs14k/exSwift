//
//  LoadingIndicatorViewController.swift
//  exSwift
//
//  Created by Eugene on 16/12/2018.
//  Copyright © 2018 Eugene. All rights reserved.
//

import UIKit

private let defaultcolor = UIColor.white
private let appearanceDuration: TimeInterval = 0.15

private let circleColor: UIColor = UIColor.white
private let endAngle: CGFloat = 310
private let rotateDuration: CFTimeInterval = 1
private let radiusScale: CGFloat = 0.85
private let radiusInset: CGFloat = 0


// Circular progress view with fading tale
final class CometGradientLoaderView: UIView, LoadingIndicator {
    
    // MARK: - Public properties
    
    var isAnimating: Bool {
        return alpha == 0 ? false : true
    }
    
    var loaderColor: UIColor = defaultcolor {
        didSet {
            redrawLoader()
        }
    }
    
    
    // MARK: - Subviews
    
    private let viewForProgressLayer = UIView()
    private var progressLayer: CAShapeLayer!
    
    
    // MARK: - Private Properties
    
    private let endCoeffecientConstant: CGFloat = 0.7
    private let circleWidth: CGFloat
    private var loaderViewStyle: GradientLoaderStyle
    private var rotateAnimation: CABasicAnimation?
    
    
    // MARK: - Init
    
    init(style: GradientLoaderStyle = .regular) {
        
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
        
        let endAngle: CGFloat = 310
        let endCoeffecient = endAngle * endCoeffecientConstant
        let center = loaderViewCenter
        let radius = loaderCircleRadius
        
        var currentPoint = CGPoint.zero
        
        for i in stride(from: 0, through: endAngle, by: 1) {
            
            let interLayer = CAShapeLayer()
            interLayer.frame = viewForProgressLayer.bounds
            interLayer.fillColor = UIColor.clear.cgColor
            interLayer.strokeColor = circleColor.withAlphaComponent(i / endCoeffecient).cgColor
            interLayer.lineWidth =  circleWidth + (i / endCoeffecient)
            interLayer.lineCap = CAShapeLayerLineCap.round
            
            let path = UIBezierPath()
            let initialDegrees = i * .pi / 180
            let intialPosX = center.x + radius * cos(initialDegrees)
            let initialPosY = center.y + radius * sin(initialDegrees)
            currentPoint = CGPoint(x: intialPosX, y: initialPosY)
            path.move(to: currentPoint)
            
            let degreesTo = (i + 1) * .pi / 180
            let posToX = center.x + radius * cos(degreesTo)
            let posToY = center.y + radius * sin(degreesTo)
            
            path.addLine(to: CGPoint(x: posToX, y: posToY))
            
            interLayer.path = path.cgPath
            
            progressLayer.addSublayer(interLayer)
        }
        
    }
    
    private func setupLoader() {
        
        progressLayer = CAShapeLayer()
        drawLoaderCircle()
        viewForProgressLayer.layer.addSublayer(progressLayer)
        viewForProgressLayer.layer.rotate360Degrees(duration: rotateDuration, timingFunction: CAMediaTimingFunction(controlPoints: 0.45, 0.69, 0.99, 0.97))
    }
    
    private func resetLoader() {
        
        if progressLayer == nil { return }
        
        progressLayer.removeFromSuperlayer()
        viewForProgressLayer.layer.remove360DegreesRotation()
        rotateAnimation = nil
        progressLayer = nil
    }
    
    private func redrawLoader() {
        
        if progressLayer != nil {
            resetLoader()
        }
        
        setupLoader()
    }
    
    
    // MARK: - Helpers
    
    private var progressViewSize: CGSize {
        return loaderViewStyle.size
    }
    
    private var smallestEdge: CGFloat {
        return min(progressViewSize.width, progressViewSize.height)
    }
    
    private var loaderViewCenter: CGPoint {
        return CGPoint(x: frame.width / 2, y: frame.height / 2)
    }
    
    private var loaderCircleRadius: CGFloat {
        return (smallestEdge / 2 * radiusScale - radiusInset)
    }
    
}

