//
//  CircularLoaderView.swift
//  exSwift
//
//  Created by Eugene on 17/12/2018.
//  Copyright © 2018 Eugene. All rights reserved.
//

import UIKit

private let appearanceDuration: TimeInterval = 0.15
private let endAngle: CGFloat = 310
private let radiusScale: CGFloat = 0.85
private let radiusInset: CGFloat = 0


// Circular flat progress view
final class CircularLoaderView: UIView, LoadingIndicator {
    
    // MARK: - Public properties
    
    var isAnimating: Bool {
        return alpha == 1 ? true : false
    }
    
    
    // MARK: - Private properties
    
    private let drawer: CircularActivityIndicatorDrawerProtocol
    private var activityIndicatorLayer: CALayer! = CALayer()
    
    
    // MARK: - Init
    
    init(style: CircularActivityIndicatorStyle) {
        
        self.drawer = style.drawer
        super.init(frame: .zero)
        drawSelf()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Consider creating CometLoaderView in code.")
    }
    
    
    // MARK: - Drawing
    
    private func drawSelf() {
        
        alpha = 0
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: drawer.size.width).isActive = true
        heightAnchor.constraint(equalToConstant: drawer.size.height).isActive = true
        layer.addSublayer(activityIndicatorLayer)
    }
    
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        activityIndicatorLayer.frame = view.bounds
        redrawLoader()
    }
    
    
    // MARK: - Public methods
    
    func start() {
        
        superview?.isUserInteractionEnabled = false
        superview?.bringSubviewToFront(self)
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
            self.resetLoader()
        })
    }
    
    
    // MARK: - Private methods
    
    private func setupLoader() {
        
        let layer = drawer.createActivityIndicator()
        activityIndicatorLayer.addSublayer(layer)
    }
    
    private func resetLoader() {
        
        activityIndicatorLayer.sublayers?.forEach({ $0.removeFromSuperlayer() })
        activityIndicatorLayer.removeAllAnimations()
    }
    
    private func redrawLoader() {
        resetLoader()
        setupLoader()
    }
    
}


