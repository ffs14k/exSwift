//
//  LoadingCell.swift
//  exSwift
//
//  Created by Eugene on 16/12/2018.
//  Copyright © 2018 Eugene. All rights reserved.
//

import UIKit

final class LoadingCell: UITableViewCell {
    
    // MARK: - Properties
    
    struct ViewModel: ViewModelProtocol {
        let loadingIndicator: LoadingIndicator
    }
    
    private var loadingIndicator: LoadingIndicator = {
        let loader = CometLoaderView(style: .regular)
        return loader
    }()
    
    // MARK: - Subviews
    
    private var container: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        drawSelf()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        drawSelf()
    }
    
    private func drawSelf() {
        
        selectionStyle = .none
        
        addSubview(container)
        container.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        container.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        container.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        container.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        container.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        
    }
    
    func toggleLoadingIndicator() {
        loadingIndicator.isAnimating ? loadingIndicator.stop() : loadingIndicator.start()
    }
    
}

extension LoadingCell: Setupable {
    
    func setup(with model: ViewModelProtocol) {
        
        guard let model = model as? ViewModel else {
            fatalError("Incorrect model passed")
        }
        
        loadingIndicator = model.loadingIndicator
        
        container.addSubview(loadingIndicator.view)
        loadingIndicator.view.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        loadingIndicator.view.centerYAnchor.constraint(equalTo: container.centerYAnchor).isActive = true
        
        loadingIndicator.start()
    }
    
}
