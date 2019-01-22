//
//  Collection+AtLeastOne.swift
//  exSwift
//
//  Created by Eugene on 20/01/2019.
//  Copyright © 2019 Eugene. All rights reserved.
//

extension Collection {
    
    var hasAtLeastOneElement: Bool {
        
        guard let _ = indices.first else { return false }
        return true
    }
    
}
