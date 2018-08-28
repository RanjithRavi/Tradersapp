//
//  RequestProtocol.swift
//  Tradersapp
//
//  Created by Ranjith Ravichandran on 17/08/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import Foundation

public protocol RequestProtocol {
    
    var path: String { get set }
    
    var method: RequestMethod? { get set }
    
    var urlQuery: ParametersDict? { get set }
    
    var body: RequestBody? { get set }
    
    var headers: HeadersDict? { get set }
    
    var cachePolicy: URLRequest.CachePolicy? { get set }
    
    var timeout: TimeInterval? { get set }
    
    func headers(in service: ServiceProtocol) -> HeadersDict
    
    func url(in service: ServiceProtocol, params: ParametersDict?) throws -> URL
    
    func urlRequest(in service: ServiceProtocol) throws -> URLRequest
    
    
    
}

public extension RequestProtocol {
    
    func headers(in service: ServiceProtocol) -> HeadersDict {
        
        var headers: HeadersDict = service.headers
        self.headers?.forEach({ (key, value) in headers[key] = value })
        
        return headers
    }
    
    func url(in service: ServiceProtocol, params: ParametersDict? = nil) throws -> URL {
        
        var baseURL = service.configuration.url.absoluteString.appending(path)
        
        if let _ = params, let encodedString = try? params!.urlEncodedString() {
            baseURL.append(encodedString)
        }
        
        guard let url = URL(string: baseURL) else {
            throw NetworkError.invalidURL(baseURL)
        }
        
        return url
    }
    
    func urlRequest(in service: ServiceProtocol) throws -> URLRequest {
        
        let requestURL = try url(in: service, params: urlQuery)
        
        let cachePolicy = self.cachePolicy ?? service.configuration.cachePolicy
        let timeout = self.timeout ?? service.configuration.timeout
        let headers = self.headers(in: service)
        
        var urlRequest = URLRequest(url: requestURL, cachePolicy: cachePolicy, timeoutInterval: timeout)
        urlRequest.httpMethod = (method ?? .get).rawValue
        urlRequest.allHTTPHeaderFields = headers
        
        if let httpBody = try body?.encodedData() {
            urlRequest.httpBody = httpBody
        }
        
        return urlRequest
    }
}
