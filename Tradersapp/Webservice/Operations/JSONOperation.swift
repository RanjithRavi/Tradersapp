//
//  JSONOperation.swift
//  Tradersapp
//
//  Created by Ranjith Ravichandran on 17/08/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import Foundation

open class JSONOperation<Model : Codable>: SCOperationProtocol {
    
    public var request: RequestProtocol?
    
    public required init(_ request: RequestProtocol) {
        self.request = request
    }
    
    public func execute(in service: ServiceProtocol, retry: Int? = 0,
                        completion: @escaping (Model?) -> Void,
                        failure: @escaping (Error) -> Void) {
        
        guard let request = self.request else {
            debugPrint("The request is missing")
            return
        }
        
        service.execute(request, retry: retry, completion: { (response) in
            
            do {
                print("reposen-- \(response.toJSON())")
                if let data = response.data {
                    let items =  try JSONDecoder().decode(Model.self, from: data)
                     print("success-- \(items)")
                    completion(items)
                    
                } else {
                    print("failuer--)")
                    completion(nil)
                }
                
            } catch {
                failure(error) // Could not parse the JSON
            }
        }) { (error) in
            
            failure(error) // The request has failed
        }
        
        
    }
    
}
