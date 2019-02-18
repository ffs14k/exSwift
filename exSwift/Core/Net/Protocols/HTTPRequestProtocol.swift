//
//  HTTPRequestProtocol.swift
//  exSwift
//
//  Created by Eugene on 18/02/2019.
//  Copyright © 2019 Eugene. All rights reserved.
//

protocol HTTPRequestProtocol {
    
    var scheme: String { get }
    var headers: [String: String]? { get }
    var queryItems: [String: String]? { get }
}
