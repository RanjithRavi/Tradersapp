//
//  AccessToken.swift
//  Tradersapp
//
//  Created by Ranjith Ravichandran on 17/08/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import Foundation
struct AccessToken: Codable {
    
    var tokenType: String?
    var expiresIn: Double?
    var accessToken: String?
    var refreshToken: String?
    
    var expirationDate: Date?
    
    enum CodingKeys: String, CodingKey {
        
        case tokenType    = "token_type"
        case expiresIn    = "expires_in"
        case accessToken  = "access_token"
        case refreshToken = "refresh_token"
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.accessToken = try? container.decode(String.self, forKey: .accessToken)
        self.expiresIn = try? container.decode(Double.self, forKey: .expiresIn)
        
        self.expirationDate = Date(timeIntervalSinceNow: self.expiresIn!)
        
        //        if let utc = try? container.decode(TimeInterval.self, forKey: .expiresIn) {
        //            self.expirationDate = Date(timeIntervalSince1970: utc)
        //        }
        self.tokenType = try? container.decode(String.self, forKey: .tokenType)
        self.refreshToken = try? container.decode(String.self, forKey: .refreshToken)
    }
    
    init() {}
    
    func isValid() -> Bool {
        let aTimeInterval = Date().timeIntervalSince1970
        
        let bTimeInterval = Int(aTimeInterval)
        
        let expiration = self.expirationDate?.timeIntervalSince1970
        
        let resultedExpiration = Int(expiration!)
        
        return resultedExpiration > bTimeInterval
    }
}
