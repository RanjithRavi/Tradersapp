//
//  RequestBody.swift
//  Tradersapp
//
//  Created by Ranjith Ravichandran on 17/08/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import Foundation


public struct RequestBody {
    
    let data: Any?
    
    let query: String?
    
    let encoding: Encoding
    
    public enum Encoding {
        
        case rawData
        case urlEncoded
        case json
        case formData
        case formUrlEncoded
    }
    
    private init(_ data: Any, as encoding: Encoding = .json, query: String? = nil) {
        self.data = data
        self.encoding = encoding
        self.query = query
    }
    
    public static func json(_ data: Any) -> RequestBody {
        return RequestBody(data, as: .json)
    }
    
    public static func urlEncoded(_ data: ParametersDict) -> RequestBody {
        
        let encodedString = try? data.urlEncodedString()
        return RequestBody(data, query: encodedString)
    }
    
    public static func formUrlEncoded(_ data: ParametersDict) -> RequestBody {
        return RequestBody(data, as: .formUrlEncoded)
    }
    
    public static func raw(data: Data) -> RequestBody {
        return RequestBody(data, as: .rawData)
    }
    
    public static func formData(data: Data) -> RequestBody {
        return RequestBody(data, as: .formData)
    }
    
//    public static func formData(formData: FormData) -> RequestBody {
//        return RequestBody(formData.data, as: .formData)
//    }
    
    public func encodedData() throws -> Data? {
        
        switch self.encoding {
        case .rawData, .formData:
            return data as? Data
            
        case .formUrlEncoded:
            let encodedString = try (data as! ParametersDict).formUrlEncodedString()
            guard let data = encodedString.data(using: .utf8) else {
                throw NetworkError.dataIsNotEncodable(encodedString)
            }
            return data
            
        case .urlEncoded:
            return nil // There is no data
        case .json:
            guard let _ = data else { return nil }
            return try? JSONSerialization.data(withJSONObject: data!, options: [])
            
        }
    }

}



extension Data {
    
    mutating func appendString(_ string: String) {
        
        if let data = string.data(using: String.Encoding.utf8, allowLossyConversion: false) {
            append(data)
        }
        
    }
}
