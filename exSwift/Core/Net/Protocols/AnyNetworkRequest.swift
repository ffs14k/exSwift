//
//  AnyNetworkRequest.swift
//  exSwift
//
//  Created by Eugene on 18/02/2019.
//  Copyright © 2019 Eugene. All rights reserved.
//

import Foundation

protocol AnyNetworkRequest: EndpointProtocol, HTTPRequestProtocol {
    
}

extension AnyNetworkRequest {
    
    var scheme: String {
        return "https"
    }
    
    var headers: [String: String]? {
        return nil
    }
    
    var queryItems: [String: String]? {
        return nil
    }
    
    var request: URLRequest {
        
        var comp = URLComponents()
        comp.scheme = scheme
        comp.host = domain.absoluteString
        comp.path = path ?? ""
        
        comp.queryItems = queryItems?.map({ (key: String, value: String) -> URLQueryItem in
            return URLQueryItem(name: key, value: value)
        })
        
        var req = URLRequest(url: comp.url!)
        
        headers?.forEach({ (key: String, value: String) in
            req.setValue(key, forHTTPHeaderField: value)
        })
        
        return req
    }
}
