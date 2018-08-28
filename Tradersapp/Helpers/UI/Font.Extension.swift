//
//  Font.Extension.swift
//  Tradersapp
//
//  Created by Ranjith Ravichandran on 19/06/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import Foundation

import UIKit
  
    struct FONT {
        
        //Size14
        static let SEMIBOLD_14 = UIFont.systemFont(ofSize: 14 , weight: .semibold)
        static let BOLD_14 = UIFont.systemFont(ofSize: 14 , weight: .bold)
        static let REGULAR_14 = UIFont.systemFont(ofSize: 14 , weight: .regular)
        static let MEDIUM_14 = UIFont.systemFont(ofSize: 14 , weight: .medium)
        static let MEDIUM_12 = UIFont.systemFont(ofSize: 12 , weight: .medium)
        static let SEMIBOLD_12 = UIFont.systemFont(ofSize: 12 , weight: .semibold)


    }

extension UIFont {
    
    class func avenirLight(size :CGFloat) -> UIFont? {
        return UIFont(name: "AvenirLTStd-Light", size: size)
    }
    
    class func avenirBlack(size :CGFloat) -> UIFont? {
        return UIFont(name: "AvenirLTStd-Black", size: size)
    }
    
    class func avenirBook(size :CGFloat) -> UIFont? {
        return UIFont(name: "AvenirLTStd-Book", size: size)
    }
    
    class func avenirMedium(size :CGFloat) -> UIFont? {
        return UIFont(name: "AvenirLTStd-Medium", size: size)
    }
    
    class func latoMedium(size :CGFloat) -> UIFont? {
        return UIFont(name: "Lato-Medium", size: size)
    }
    
    class func avenirHeavy(size :CGFloat) -> UIFont? {
        return UIFont(name: "AvenirLTStd-Heavy", size: size)
    }
    

}
