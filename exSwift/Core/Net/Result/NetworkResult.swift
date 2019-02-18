//
//  NetworkResult.swift
//  exSwift
//
//  Created by Eugene on 18/02/2019.
//  Copyright © 2019 Eugene. All rights reserved.
//

enum NetworkError: Error {
    
    case clientError(Error)
    case emptyResponse
    case serverError
    case emptyData
    case decodingError
}

enum NetworkResult<T: Codable> {
    
    case success(_ some: T)
    case failure(_ error: NetworkError)
}
