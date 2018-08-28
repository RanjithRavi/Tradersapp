//
//  Response.swift
//  Tradersapp
//
//  Created by Ranjith Ravichandran on 17/08/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import Foundation


public class Response: ResponseProtocol {
    
    public enum Result {
        
        case success
        case error
        case noResponse
        
        private static let successCodes: Range<Int> = 200..<299
        
        public static func from(response: HTTPURLResponse?) -> Result {
            
            guard let _ = response else {
                return .noResponse
            }
            
            return (Result.successCodes.contains(response!.statusCode) ? .success : .error)
        }
        
        public var code: Int? {
            
            switch self {
                
            case .success: return 1
            case .error: return 0
            case .noResponse: return nil
            }
        }
    }
    
    public let type: Response.Result
    
    public var httpStatusCode: Int? {
        return self.type.code
    }
    
    public let httpRepsonse: HTTPURLResponse?
    
    public var data: Data?
    
    public let error: Error?
    
    public let request: RequestProtocol
    
    public init(repsonse: HTTPURLResponse, data: Data?, request: RequestProtocol, error: Error?) {
        
        self.type = Result.from(response: repsonse)
        self.httpRepsonse = repsonse
        self.data = data
        self.request = request
        self.error = error
    }
    
    public func toJSON() -> JSONDict {
        return cachedJSON
    }
    
    public func toString(_ encoding: String.Encoding? = nil) -> String? {
        
        guard let _ = data else { return nil }
        return String(data: data!, encoding: encoding ?? .utf8)
    }
    
    private lazy var cachedJSON: JSONDict = {
        
        if let jsonDict = try? JSONSerialization.jsonObject(with: data ?? Data(), options: .allowFragments) as? JSONDict {
            return jsonDict!
        }
        
        return JSONDict()
    }()
}
