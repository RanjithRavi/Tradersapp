//
//  NetworkManager.swift
//  Tradersapp
//
//  Created by Ranjith Ravichandran on 17/08/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import Foundation
import UIKit

class NetworkManager {
    
    static var shared = NetworkManager()
    
    let headers = [
        "Authorization": ApiCredentials.authorization.rawValue,
        "Content-Type": ApiCredentials.contentType.rawValue
    ]
    
    var service: Service!
    
    var configType: SCServiceConfigType!
    
    public enum SCServiceConfigType {
        case dev
    }
    
    init() {
        
        if let sc = ServiceConfig(base: NetworkManager.baseStringURL(configType: .dev)) {
            self.service = Service(sc)
        }
    }
    
    private static func baseStringURL(configType: SCServiceConfigType) -> String {
        
        switch configType {
        case .dev:
            return "" //Base Url "https://socredit.apps-dev.io/"
        }
    }
    
    
  /* func callLoginAPI( emailID : String,
                       password : String,
                       success: @escaping () -> Void,
                       failure: @escaping (Error) -> Void) {
        
        
        let parameters: ParametersDict = ["email" : emailID,
                                          "password" : password
        ]
        let request = Request(method: .post, path: ApiPath.login.rawValue, parameters: parameters, postDataType: .json)
        
        
        request.parameters = parameters
        request.headers = headers
        
    let operation = JSONOperation<model>(request)
        
        operation.execute(in: service, completion: { (response) in
            
            guard (response?.errorCode) == nil else{
                print("response?.error?.errorCode---\(response?.errorCode)")
                failure(ConnectionError.invalidEmailOrPassword)
                return
            }
            print("response---\(response?.userData.email)")
            success(response)
            
        }) { (error) in
            
            debugPrint(error)
        }
        
    }
    
   func callForgotPasswordAPI( emailID : String,
                                success: @escaping (ForgotPassswordModel?) -> Void,
                                failure: @escaping (Error) -> Void) {
        
        
        let parameters: ParametersDict = ["email" : emailID]
        let request = Request(method: .post, path: ApiPath.forgotPassword.rawValue, parameters: parameters, postDataType: .json)
        
        request.parameters = parameters
        request.headers = headers
        
        let operation = JSONOperation<ForgotPassswordModel>(request)
        
        operation.execute(in: service, completion: { (response) in
            
            success(response)
            
        }) { (error) in
            print("forgotPassowrd Error --- \(error)")
            failure(error)
        }
        
    }
    
     */
 
  
}
