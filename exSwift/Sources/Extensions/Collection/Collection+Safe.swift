//
//  Array+Safe.swift
//  exSwift
//
//  Created by Eugene on 18/12/2018.
//  Copyright © 2018 Eugene. All rights reserved.
//

public extension Collection {

    subscript (safe index: Index) -> Iterator.Element? {
        guard indices.contains(index) else { return nil }
        return self[index]
    }
    
    subscript(safe startIndex: Index, endIndex: Index) -> SubSequence? {
        
        guard indices.contains(startIndex), indices.contains(endIndex) else {
            return nil
        }
        
        return self[startIndex...endIndex]
    }
    
    subscript(safe range: ClosedRange<Index>) -> SubSequence? {
        
        guard indices.contains(range.lowerBound), indices.contains(range.upperBound) else {
            return nil
        }
        
        return self[range]
    }
    
    subscript(safe range: Range<Index>) -> SubSequence? {
        
        guard indices.contains(range.lowerBound), indices.contains(range.upperBound) else {
            return nil
        }
        
        return self[range]
    }
    
}
