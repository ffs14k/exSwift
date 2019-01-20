//
//  LoadingIndicatorViewController.swift
//  exSwift
//
//  Created by Eugene on 16/12/2018.
//  Copyright © 2018 Eugene. All rights reserved.
//

import UIKit

private let defaultСolor = UIColor.white
private let appearanceDuration: TimeInterval = 0.15

private let endAngle: CGFloat = 310
private let rotateDuration: CFTimeInterval = 1
private let radiusScale: CGFloat = 0.85
private let radiusInset: CGFloat = 0


// Circular flat progress view
final class CometLoaderView: UIView, LoadingIndicator {
    
    // MARK: - Public properties
    
    var isAnimating: Bool {
        return viewForProgressLayer.layer.isRotateAnimation360DegreesExsists
    }
    
    var loaderColor: UIColor = defaultСolor {
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
    private var loaderViewStyle: FlatLoaderStyle
    private var rotateAnimation: CABasicAnimation?
    
    
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
        
        let endAngle: CGFloat = 1.6 * .pi
        
        let interLayer = CAShapeLayer()
        let path = UIBezierPath(arcCenter: loaderViewCenter, radius: loaderCircleRadius, startAngle: 0, endAngle: endAngle, clockwise: true)
        
        interLayer.frame = viewForProgressLayer.bounds
        interLayer.path = path.cgPath
        interLayer.fillColor = UIColor.clear.cgColor
        interLayer.strokeColor = loaderColor.cgColor
        interLayer.lineWidth = circleWidth
        interLayer.lineCap = CAShapeLayerLineCap.round
        
        progressLayer.addSublayer(interLayer)
    }
    
    private func setupLoader() {
        
        progressLayer = CAShapeLayer()
        drawLoaderCircle()
        viewForProgressLayer.layer.addSublayer(progressLayer)
        viewForProgressLayer.layer.rotate360Degrees(duration: 1)
        
    }
    
    private func resetLoader() {
        
        guard let progressLayer = progressLayer else { return }
        
        progressLayer.removeFromSuperlayer()
        viewForProgressLayer.layer.remove360DegreesRotation()
        rotateAnimation = nil
        self.progressLayer = nil
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
