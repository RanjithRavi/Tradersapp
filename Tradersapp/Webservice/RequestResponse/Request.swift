//
//  Request.swift
//  Tradersapp
//
//  Created by Ranjith Ravichandran on 17/08/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import Foundation

public class Request: RequestProtocol {
    
    public var path: String
    
    public var body: RequestBody?
    
    public var method: RequestMethod?
    
    public var urlQuery: ParametersDict?
    
    public var parameters: Any?
    
    public var headers: HeadersDict?
    
    public var cachePolicy: URLRequest.CachePolicy?
    
    public var timeout: TimeInterval?
    
    public init(method: RequestMethod = .get, path: String = "", urlQuery: ParametersDict? = nil, parameters: Any? = nil,body: RequestBody? = nil) {
        
        self.method = method
        self.path = path
        self.urlQuery = urlQuery
        self.body = body
        self.parameters = parameters
    }
    
    public convenience init(method: RequestMethod = .get, path: String = "", urlQuery: ParametersDict? = nil, parameters: Any? = nil, postDataType : PostDataType = .json) {
        
        let requestBody : RequestBody?
        
        switch postDataType {
        case .json:
            requestBody = (parameters != nil) ? RequestBody.json(parameters!) : nil
            break
        case .rawData:
            requestBody = (parameters != nil) ? RequestBody.raw(data: parameters as! Data) : nil
            break
        case .formData:
            requestBody = (parameters != nil) ? RequestBody.formData(data: parameters as! Data) : nil
            break
        }
        
        
        self.init(method: method, path: path, urlQuery: urlQuery, body: requestBody)
        
        
    }
}
