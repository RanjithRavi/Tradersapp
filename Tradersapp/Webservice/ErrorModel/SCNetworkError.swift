//
//  SCNetworkError.swift
//  Tradersapp
//
//  Created by Ranjith Ravichandran on 17/08/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import Foundation


public enum NetworkError: Error {
    case dataIsNotEncodable(_: Any)
    case invalidURL(_: String)
    case noResponse
    case failToCreateNetworkRequest(_ : RequestProtocol)
}


public enum ConnectionError: Error {
    case noResponse
    case invalidEmailOrPassword
    case error(typeError : String?)
}

extension ConnectionError : LocalizedError{
    public var errorDescription : String?{
        switch self {
        case .noResponse:
            return ""
        case .invalidEmailOrPassword:
            return SCNetworkErrorMessage.invalidCredentials
        case .error(let typeError):
            if let typeError = typeError, typeError == "Incorrect email or password." {
                return SCNetworkErrorMessage.invalidCredentials
            }
            return ""
        }
    }
}
