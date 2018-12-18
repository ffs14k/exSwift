//
//  Array+Safe.swift
//  exSwift
//
//  Created by Eugene on 18/12/2018.
//  Copyright © 2018 Eugene. All rights reserved.
//

import Foundation

public extension Collection {

    subscript (safe index: Index) -> Iterator.Element? {
        guard indices.contains(index) else { return nil }
        return self[index]
    }
    
}
