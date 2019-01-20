//
//  Setupable.swift
//  exSwift
//
//  Created by Eugene on 18/12/2018.
//  Copyright © 2018 Eugene. All rights reserved.
//

protocol ViewModelProtocol { }

protocol Setupable: AnyObject {
    
    func setup(with model: ViewModelProtocol)
}
