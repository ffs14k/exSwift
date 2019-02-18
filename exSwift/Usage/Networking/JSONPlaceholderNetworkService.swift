//
//  JSONPlaceholderNetworkService.swift
//  exSwift
//
//  Created by Eugene on 18/02/2019.
//  Copyright © 2019 Eugene. All rights reserved.
//

import Foundation

final class JSONPlaceholderNetworkService {
    
    // MARK: - Local types
    
    enum Request: AnyHTTPRequest {
        
        case comments(postID: Int?)
        
        
        var domain: URL {
            return URL(string: "jsonplaceholder.typicode.com")!
        }
        
        var path: String? {
            switch self {
            case .comments:
                return "/comments"
            }
        }
        
        var queryItems: [String : Any?]? {
            
            switch self {
            case .comments(let postID):
                return ["postId": postID]
            }
            
        }
        
    }
    
    
    // MARK: - Properties
    
    private let service = NetworkService(session: URLSession.shared)
    
    
    // MARK: - Public methods
    
    func getComments(withPostID postID: Int? = nil, completion: @escaping (NetworkResult<[CommentRemote]>) -> Void ) {
        
        service.request(urlRequest: Request.comments(postID: postID)) { result in
            completion(result)
        }
        
    }
    
    
}
