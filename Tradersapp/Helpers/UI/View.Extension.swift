//
//  View.Extension.swift
//  Tradersapp
//
//  Created by Ranjith Ravichandran on 18/06/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import UIKit

extension UIView {
    
    class func shadowView (backgroundColor : UIColor) -> UIView {
        
        let shadowView  = UIView ()
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        shadowView.backgroundColor = backgroundColor
        shadowView.layer.masksToBounds = true
        return shadowView
        
    }
}
