//
//  CustomLoaderView.swift
//  Loader
//
//  Created by Ranjith Ravichandran on 07/08/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import UIKit

extension UILabel {

    class func initLabel(BGColor: UIColor = UIColor.clear, tag: Int? = nil, text: String? = "Loading..", textColor: UIColor = UIColor.black, font: UIFont = UIFont.boldSystemFont(ofSize: 12)) -> UILabel {
        let returnView = UILabel.init()
        returnView.translatesAutoresizingMaskIntoConstraints = false
        returnView.backgroundColor = BGColor
        returnView.text = text
        returnView.textColor = textColor
        returnView.font = font
        
        if let viewTag = tag {
            returnView.tag = viewTag
        }
        return returnView
    }
}
