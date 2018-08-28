//
//  Image.swift
//  Tradersapp
//
//  Created by Ranjith Ravichandran on 01/07/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    class func TDSimageView(imageName: String?) -> UIImageView {
        
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.contentMode = .scaleAspectFill;
        
        imageView.clipsToBounds = true
        
        if imageName != nil {
            imageView.image = UIImage(named: imageName!)
        }
        
        return imageView
}

}
