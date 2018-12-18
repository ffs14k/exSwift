//
//  LoadingIndicatorViewController.swift
//  exSwift
//
//  Created by Eugene on 16/12/2018.
//  Copyright © 2018 Eugene. All rights reserved.
//

import UIKit

protocol LoadingIndicator {
    
    var view: UIView { get }
    var isAnimating: Bool { get }
    func start()
    func stop()
}

extension LoadingIndicator where Self: UIView {
    
    var view: UIView {
        return self
    }
}

extension UIActivityIndicatorView: LoadingIndicator {
    
    func start() {
        startAnimating()
    }
    
    func stop() {
        stopAnimating()
    }
    
}
