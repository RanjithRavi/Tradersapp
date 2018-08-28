//
//  ServiceProtocol.swift
//  Tradersapp
//
//  Created by Ranjith Ravichandran on 17/08/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import Foundation

public protocol ServiceProtocol {
    
    var configuration: ServiceConfig { get }
    
    var headers: HeadersDict { get }
    
    init(_ configuration: ServiceConfig)
    
    func execute(_ request: RequestProtocol,
                 retry: Int?,
                 completion: @escaping (ResponseProtocol) -> Void,
                 failure:  @escaping (Error) -> Void )
    
}
