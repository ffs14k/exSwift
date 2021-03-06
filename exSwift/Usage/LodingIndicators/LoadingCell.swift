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
    
    private lazy var loadingIndicator: ActivityIndicator = {
        let loadingIndicator = CircularActivityIndicator(style: .flat(type: .regular))
        return loadingIndicator
    }()
    
    
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
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Private methods
    
    private func drawSelf() {
        
        selectionStyle = .none
        
        addSubview(container)
        container.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        container.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        container.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        container.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        
        container.addSubview(loadingIndicator.view)
        loadingIndicator.view.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        loadingIndicator.view.centerYAnchor.constraint(equalTo: container.centerYAnchor).isActive = true
        
        loadingIndicator.start()
    }
    
    
    // MARK: - Public methods
    
    func toggleLoadingIndicator() {
        loadingIndicator.isAnimating ? loadingIndicator.stop() : loadingIndicator.start()
    }
    
}
