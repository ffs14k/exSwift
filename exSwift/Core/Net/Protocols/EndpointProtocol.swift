//
//  EndpointProtocol.swift
//  exSwift
//
//  Created by Eugene on 18/02/2019.
//  Copyright © 2019 Eugene. All rights reserved.
//

import Foundation

protocol EndpointProtocol {
    
    var domain: URL { get }
    var path: String? { get }
}

extension EndpointProtocol {
    
    var path: String? {
        return nil
    }
    
    var endpoint: URL {
        let url = URL(string: domain.absoluteString)!
            .appendingPathComponent(path ?? "")
        return url
    }
    
}
