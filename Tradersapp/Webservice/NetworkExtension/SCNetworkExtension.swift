//
//  SCNetworkExtension.swift
//  Tradersapp
//
//  Created by Ranjith Ravichandran on 17/08/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import Foundation


public extension String {
    
    public func escape() -> String {
        
        let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let subDelimitersToEncode = "!$&'()*+,;="
        
        var allowedCharacterSet = CharacterSet.urlQueryAllowed
        allowedCharacterSet.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        
        var escaped = ""
        
        if #available(iOS 8.3, *) {
            escaped = addingPercentEncoding(withAllowedCharacters: allowedCharacterSet) ?? self
        } else {
            let batchSize = 50
            var index = startIndex
            
            while index != endIndex {
                let startIndex = index
                let endIndex = self.index(index, offsetBy: batchSize, limitedBy: self.endIndex) ?? self.endIndex
                let range = startIndex..<endIndex
                
                let substring = self[range]
                
                escaped += substring.addingPercentEncoding(withAllowedCharacters: allowedCharacterSet) ?? String(substring)
                
                index = endIndex
            }
        }
        
        return escaped
    }
    
}

public extension Dictionary where Key == String, Value == Any? {
    
    private func query() -> String {
        
        //TODO: Handle Bool and Numbers
        var components: [(String, String)] = []
        
        for key in keys.sorted(by: <) {
            
            if let value = self[key] as? String {
                components.append((key.escape(), value.escape()))
            }
        }
        return components.map { "\($0)=\($1)" }.joined(separator: "&")
    }
    
    private func encodedUrl(base: String = "") throws -> URL? {
        
        guard self.count > 0 else { return nil }
        
        let items: [URLQueryItem] = self.compactMap { (key,value) in
            guard let v = value else { return nil }
            return URLQueryItem(name: key, value: String(describing: v))
        }
        
        var urlComponents = URLComponents(string: base)!
        urlComponents.queryItems = items
        
        guard let encodedString = urlComponents.url else {
            throw NetworkError.dataIsNotEncodable(self)
        }
        
        return encodedString
    }
    
    public func urlEncodedString(base: String = "") throws -> String {
        
        let encodedString = try encodedUrl()
        
        return encodedString?.absoluteString ?? ""
    }
    
    public func formUrlEncodedString(base: String = "") throws -> String {
        
        return query()
    }
    
}
