//
//  SCErrorModel.swift
//  Tradersapp
//
//  Created by Ranjith Ravichandran on 17/08/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import Foundation

protocol SCErrorProtocol {
    var errorCode : Int? { get }
    var message : String? { get }
}


class SCErrorModel : Codable {
    
    var errorCode: Int?
    var message: String?
    
    enum CodingKeys : String, CodingKey{
        
        case errorCode = "error_code"
        case message
    }
}
