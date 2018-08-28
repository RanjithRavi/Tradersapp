//
//  SCOperationProtocol.swift
//  Tradersapp
//
//  Created by Ranjith Ravichandran on 17/08/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import Foundation

protocol SCOperationProtocol {
    
    associatedtype Model
    
    var request: RequestProtocol? { get }
    
    init (_ request: RequestProtocol)
    
    func execute(in service: ServiceProtocol,
                 retry: Int?,
                 completion: @escaping (Model) -> Void,
                 failure: @escaping (Error) -> Void)
}
