//
//  NetworkService.swift
//  exSwift
//
//  Created by Eugene on 18/02/2019.
//  Copyright © 2019 Eugene. All rights reserved.
//

import Foundation

final class NetworkService {
    
    private let session: URLSession
    
    
    init(session: URLSession) {
        self.session = session
    }
    
    func request<Model: Codable>(urlRequest: AnyHTTPRequest, completion: @escaping (NetworkResult<Model>) -> Void ) {
        
        session.dataTask(with: urlRequest.request) { (data, response, error) in
            
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
            
            let decoder = JSONDecoder()
            
            do {
                
                let object = try decoder.decode(Model.self, from: data)
                result = .success(object)
                
            } catch {
                
                result = .failure(.decodingError)
            }
            
            defer {
                
                DispatchQueue.main.async {
                    completion(result)
                }
                
            }
            
        }.resume()
        
    }
    
}
