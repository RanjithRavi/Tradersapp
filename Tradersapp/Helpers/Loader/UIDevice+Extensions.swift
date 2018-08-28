//
//  CustomLoaderView.swift
//  Loader
//
//  Created by Ranjith Ravichandran on 07/08/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import UIKit

extension UIDevice {
    
    class func MULTIPLIER_W_DEFAULT(value: CFloat) -> CFloat {
        
        let resultedValue = (CGFloat(value/414.0) * UIScreen.main.bounds.size.width)
        
        return CFloat(resultedValue)
    }
    
    class func MULTIPLIER_H_DEFAULT(value: CGFloat) -> CGFloat {
        
        let resultedValue = (CGFloat(value/736.0) * UIScreen.main.bounds.size.height)
        
        return resultedValue
    }
    
    class func window() -> UIWindow {
        return UIApplication.shared.keyWindow!
    }
    
    class func open(urlString: String, options: [String: Any] = [:], completion: ((Bool) -> Void)? = nil) -> Void {
        
        if let url = URL(string: urlString) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: options, completionHandler: completion)
            } else {
                let success = UIApplication.shared.openURL(url)
                print("Open URL: \(success)")
            }
        }
    }
}
