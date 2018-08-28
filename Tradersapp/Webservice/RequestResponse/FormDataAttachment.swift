//
//  FormAttachment.swift
//  SoCredit
//
//  Created by Dhivya on 10/05/18.
//  Copyright © 2018 Appsolute. All rights reserved.
//

import Foundation

public struct FormDataAttachment {
    
    let name: String
    
    let countryCode: String?
    
    let fileName: String?
    
    let contentType: String?
    
    let data: Data
    
    init(name: String, string: String) {
        
        self.name = name
        self.data = string.data(using: .utf8) ?? Data()
        self.fileName = nil
        self.contentType = nil
        self.countryCode = nil
    }
    
    init(name: String, countryCode: String, data: Data? = Data()) {
        
        self.name = name
        self.countryCode = countryCode
        self.data = data!
        self.fileName = nil
        self.contentType = nil
    }
    
    init(data: Data, name: String, fileName: String? = nil, contentType: String? = nil) {
        
        self.name = name
        self.data = data
        self.fileName = fileName
        self.contentType = contentType
        self.countryCode = nil
    }
}
