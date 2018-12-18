//
//  LoadersDataProvider.swift
//  exSwift
//
//  Created by Eugene on 18/12/2018.
//  Copyright © 2018 Eugene. All rights reserved.
//

import Foundation

final class LoadersDataProvider {
    
    static func getLoadersViewModel() -> [LoadingCell.ViewModel] {
        
        var result: [LoadingCell.ViewModel] = []
        
        var loadingIndicator: LoadingIndicator = CometLoaderView(style: .regular)
        var viewModel = LoadingCell.ViewModel(loadingIndicator: loadingIndicator)
        result.append(viewModel)
        
        loadingIndicator = CometGradientLoaderView(style: .regular)
        viewModel = LoadingCell.ViewModel(loadingIndicator: loadingIndicator)
        result.append(viewModel)
        
        loadingIndicator = CometReplicationLoaderView(style: .regular)
        viewModel = LoadingCell.ViewModel(loadingIndicator: loadingIndicator)
        result.append(viewModel)
        
        loadingIndicator = CometGrapeLoaderView(style: .regular)
        viewModel = LoadingCell.ViewModel(loadingIndicator: loadingIndicator)
        result.append(viewModel)
        
        return result
    }
    
}
