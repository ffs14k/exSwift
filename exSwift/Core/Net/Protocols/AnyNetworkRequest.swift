//
//  AnyNetworkRequest.swift
//  exSwift
//
//  Created by Eugene on 18/02/2019.
//  Copyright © 2019 Eugene. All rights reserved.
//

import Foundation

protocol AnyHTTPRequest: EndpointProtocol, HTTPRequestProtocol {
    
}

extension AnyHTTPRequest {
    
    var scheme: String {
        return "https"
    }
    
    var headers: [String: Any]? {
        return nil
    }
    
    var queryItems: [String: Any?]? {
        return nil
    }
    
    var request: URLRequest {
        
        var comp = URLComponents()
        comp.scheme = scheme
        comp.host = domain.absoluteString
        comp.path = path ?? ""
        
        comp.queryItems = queryItems?.map({ (key: String, value: Any?) -> URLQueryItem? in
            
            guard let value = value else { return nil }
            return URLQueryItem(name: key, value: String(describing: value))
        }).compactMap{ $0 }
        
        var req = URLRequest(url: comp.url!)
        
        headers?.forEach({ (key: String, value: Any) in
            req.setValue(String(describing: value), forHTTPHeaderField: key)
        })
        
        return req
    }
    
}
