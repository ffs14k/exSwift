//
//  LoadingIndicatorViewController.swift
//  exSwift
//
//  Created by Eugene on 16/12/2018.
//  Copyright © 2018 Eugene. All rights reserved.
//

import UIKit

protocol ActivityIndicator {
    
    var view: UIView { get }
    var isAnimating: Bool { get }
    var isUserInteractionAllowedWhileAnimating: Bool { get set }
    func start()
    func stop()
}

extension ActivityIndicator where Self: UIView {
    
    var view: UIView {
        return self
    }
    
}
