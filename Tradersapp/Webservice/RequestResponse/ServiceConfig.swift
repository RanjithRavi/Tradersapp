//
//  ServiceConfig.swift
//  Tradersapp
//
//  Created by Ranjith Ravichandran on 17/08/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import Foundation


public final class ServiceConfig: CustomStringConvertible, Equatable {
    
    private(set) var name: String
    
    private(set) var url: URL
    
    private(set) var headers: HeadersDict = [:]
    
    public var cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy
    
    public var timeout: TimeInterval = 30.0
    
    
    public init?(name: String? = nil, base urlString: String) {
        guard let url = URL(string: urlString) else { return nil }
        self.url = url
        self.name = name ?? (url.host ?? "")
    }
    
    public var description: String {
        return "\(self.name): \(self.url.absoluteString)"
    }
    
    public static func ==(lhs: ServiceConfig, rhs: ServiceConfig) -> Bool {
        return lhs.url.absoluteString.lowercased() == rhs.url.absoluteString.lowercased()
    }
    
}
