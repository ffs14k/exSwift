//
//  CometReplicationLoaderView.swift
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
final class CometReplicationLoaderView: UIView, LoadingIndicator {
    
    // MARK: - Public properties
    
    var isAnimating: Bool {
        return alpha == 1 ? true : false
    }
    
    var loaderColor: UIColor = defaultСolor {
        didSet {
            redrawLoader()
        }
    }
    
    
    // MARK: - Subviews
    
    private let viewForProgressLayer = UIView()
    private var progressLayer: CAReplicatorLayer!
    
    
    // MARK: - Private Properties
    
    private let endCoeffecientConstant: CGFloat = 0.7
    private let circleWidth: CGFloat
    private var loaderViewStyle: ReplicationLoaderStyle
    private var rotateAnimation: CABasicAnimation?
    
    
    // MARK: - Init
    
    init(style: ReplicationLoaderStyle = .regular) {
        
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
        
        progressLayer.frame = viewForProgressLayer.bounds
//        progressLayer.borderWidth = 1
//        progressLayer.borderColor = UIColor.black.cgColor
        progressLayer.instanceCount = 360
//        progressLayer.instanceDelay = 1 / 360 ------- full circle
        progressLayer.instanceDelay = 1 / 180
        let oneDegree = CGFloat.pi / 180
        progressLayer.instanceTransform = CATransform3DMakeRotation(oneDegree, 0.0, 0.0, 1.0)
        
        let center = loaderViewCenter
        let radius = loaderCircleRadius
        
        let instanceLayer = CAShapeLayer()
        instanceLayer.path = UIBezierPath(ovalIn: CGRect(x: center.x, y: center.y - radius, width: 1, height: circleWidth)).cgPath
        instanceLayer.fillColor = loaderColor.cgColor
        progressLayer.addSublayer(instanceLayer)
        
        rotateAnimation = CABasicAnimation(keyPath: "fillColor")
        guard let rotateAnimation = rotateAnimation else { return }
        rotateAnimation.fromValue = UIColor.clear.cgColor
        rotateAnimation.toValue = loaderColor.cgColor
        rotateAnimation.beginTime = -1
        rotateAnimation.duration = 1
        rotateAnimation.repeatCount = .infinity
        instanceLayer.add(rotateAnimation, forKey: nil)
    }
    
    private func setupLoader() {
        
        progressLayer = CAReplicatorLayer()
        drawLoaderCircle()
        viewForProgressLayer.layer.addSublayer(progressLayer)
    }
    
    private func resetLoader() {
        
        guard let progressLayer = progressLayer else { return }
        
        progressLayer.removeFromSuperlayer()
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


enum ReplicationLoaderStyle {
    
    case small
    case regular
    
    var size: CGSize {
        switch self {
        case .small:        return CGSize(width: 40, height: 40)
        case .regular:      return CGSize(width: 80, height: 80)
        }
    }
    
    var circleWidth: CGFloat {
        switch self {
        case .small:        return 1
        case .regular:      return 2
        }
    }
    
}
