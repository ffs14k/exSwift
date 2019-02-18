//
//  NetworkHandlingViewController.swift
//  exSwift
//
//  Created by Eugene on 18/02/2019.
//  Copyright © 2019 Eugene. All rights reserved.
//

import UIKit

final class NetworkHandlingViewController: UIViewController {
    
    
    let nw = JSONPlaceholderNetworkService()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        nw.getComments(completion: { result in
            
            switch result {
            case .success(let model):
                return
                model.forEach({
                    print($0.comment)
                })
                
            case .failure(let error):
                print(error)
            }
            
        })
        
    }
    
}
