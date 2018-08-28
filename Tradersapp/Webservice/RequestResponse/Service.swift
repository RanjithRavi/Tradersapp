//
//  Service.swift
//  Tradersapp
//
//  Created by Ranjith Ravichandran on 17/08/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import Foundation

public class Service: ServiceProtocol {
    
    public var configuration: ServiceConfig
    
    public var headers: HeadersDict
    
    private lazy var session: URLSession = {
        
        let sessionConfiguration = URLSessionConfiguration.default
        
        sessionConfiguration.httpAdditionalHeaders = headers
        
        return URLSession(configuration: sessionConfiguration, delegate: nil, delegateQueue: nil)
    }()
    
    public required init(_ configuration: ServiceConfig) {
        
        self.configuration = configuration
        self.headers = configuration.headers
    }
    
    public func execute(_ request: RequestProtocol,
                        retry: Int? = 0,
                        completion: @escaping (ResponseProtocol) -> Void,
                        failure: @escaping (Error) -> Void ) {
        
        if let urlRequest = try? request.urlRequest(in: self) {
            
            let dataTask = session.dataTask(with: urlRequest, completionHandler: { (data, response, error) -> Void in
                
                if let httpResponse = response as? HTTPURLResponse {
                    
                    let dataResponse = Response(repsonse: httpResponse , data: data, request: request, error: error)
                    
                    print("status --- \(httpResponse._IQDescription())---dataResponse--- \(dataResponse.toString())")
                    
//                    if (dataResponse.type == .success){
                    
                        completion(dataResponse)
                        
//                    }else {
//                        print("dataResponse.error--- \(dataResponse.error)--- \(error)--data-- \(dataResponse.toString())--response--\(data)")
//                        if let error = dataResponse.error {
//                            failure(error)
//                        }
//                    }
                    
                } else {
                    
                    if let error = error {
                         failure(NetworkError.noResponse)
                    }
                    
                   
                    
                    debugPrint(response.debugDescription)
                    
                    debugPrint("NetworkService : Could not create the response !")
                }
            })
            
            dataTask.resume()
            
        } else {
            
            
            failure(NetworkError.failToCreateNetworkRequest(request))
            
            debugPrint("NetworkService : Could not create the request !")
        }
        
    }
}
