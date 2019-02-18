//
//  CommentRemote.swift
//  exSwift
//
//  Created by Eugene on 18/02/2019.
//  Copyright © 2019 Eugene. All rights reserved.
//

struct CommentRemote: Codable {
    
    let postID: Int
    let userID: Int
    let userName: String
    let userEmail: String
    let comment: String
    
    enum CodingKeys: String, CodingKey {
        
        case postID = "postId"
        case userID = "id"
        case userName = "name"
        case userEmail = "email"
        case comment = "body"
    }
    
}
