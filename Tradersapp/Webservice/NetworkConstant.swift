//
//  NetworkConstant.swift
//  Tradersapp
//
//  Created by Ranjith Ravichandran on 17/08/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import Foundation

/// Define the header's dictionary
public typealias HeadersDict = [String: String]

/// Define the parameters's dictionary
public typealias ParametersDict = [String: Any?]

public typealias JSONDict = [String : Any?]

public enum RequestMethod: String {
    
    case get    = "GET"
    case post   = "POST"
    case put    = "PUT"
    case delete = "DELETE"
    case patch  = "PATCH"
}

public enum PostDataType {
    
    case rawData
    case json
    case formData
}

enum ApiCredentials: String {
    
    case authorization = ""//Eg: "Basic c29fY3JlZGl0OnNvQ21MTGp6enRNQjdNdEI1aDVqMzR1Z2hRcEs4UmR3Zw=="
    case contentType = "application/json"
}

enum ApiPath: String {
    
     case login = "" //Eg
    //Here API Method
    
//    case login = "API/api/users/login"
//    case formData = "API/api/details"
//    case registerFormData = "API/api/register"
//    case forgotPassword = "API/api/users/forgotpassword"
//    case formStatusPart1 = "API/api/"
//    case formStatusPart2 = "/formstatus"
//    case formVoucherFilePart1 = "API/api/users/"
//    case formVoucherFilePart2 = "/documentupload"
}

