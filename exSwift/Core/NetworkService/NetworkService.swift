//
//  NetworkService.swift
//  exSwift
//
//  Created by Eugene on 18/02/2019.
//  Copyright © 2019 Eugene. All rights reserved.
//

import Foundation

final class NetworkService {
    
    // MARK: - Properties
    
    private let session: URLSession
    private let decoder = JSONDecoder()
    
    
    // MARK: - Init
    
    init(session: URLSession) {
        self.session = session
    }
    
    
    // MARK: - Public methods
    
    func request<Model: Codable>(urlRequest: AnyHTTPRequest, completion: @escaping (NetworkResult<Model>) -> Void ) {
        
        session.dataTask(with: urlRequest.request) { [weak self] (data, response, error) in
            
            guard let `self` = self else { return }
            
            var result: NetworkResult<Model>
            
            if let error = error {
                result = .failure(.clientError(error))
            }
            
            guard let response = response as? HTTPURLResponse else {
                result = .failure(.emptyResponse)
                return
            }
            
            guard response.statusCode == 200 else {
                result = .failure(.serverError)
                return
            }
            
            guard let data = data else {
                result = .failure(.emptyData)
                return
            }
            
            do {
                
                let object = try self.decoder.decode(Model.self, from: data)
                result = .success(object)
                
            } catch let error {
                
                result = NetworkResult.failure(NetworkError.decodeFailed(error as! DecodingError))
            }
            
            defer {
                
                DispatchQueue.main.async {
                    completion(result)
                }
                
            }
            
        }.resume()
        
    }
    
}
