//
//  ResponseProtocol.swift
//  Tradersapp
//
//  Created by Ranjith Ravichandran on 17/08/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import Foundation


public protocol ResponseProtocol {
    
    var type: Response.Result { get }
    
    var request: RequestProtocol { get }
    
    var httpRepsonse: HTTPURLResponse? { get }
    
    var httpStatusCode: Int? { get }
    
    var data: Data? { get }
    
    func toJSON() -> JSONDict
    
    func toString(_ encoding: String.Encoding?) -> String?
    
    
}
