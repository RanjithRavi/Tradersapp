//
//  Button.swift
//  Tradersapp
//
//  Created by Ranjith Ravichandran on 20/06/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import UIKit

extension UIButton {
    
    class func TDSSystemButton(target: AnyObject, selector: Selector) -> UIButton {
        
        let button = UIButton.init(type: .system)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(target, action: selector, for: .touchUpInside)
        
        return button
    }
    
    class func TDSNormalButton() -> UIButton {
        
        let button = UIButton.init(type: .custom)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }
    
    class func TDSTitleButton(backgroundcolor: UIColor, titleName:NSString, titleColor: UIColor, textFont: UIFont, target: AnyObject, selector: Selector) -> UIButton {
        
        let button = UIButton.TDSSystemButton(target: target, selector: selector)
        
        button.backgroundColor = backgroundcolor
        
        button.titleLabel?.font = textFont
        
        button.setTitle(titleName as String, for: .normal)
        
        button.setTitleColor(titleColor, for: .normal)
        
        button.titleLabel?.textAlignment = .center
        
        return button
    }
    
    class func TDSTitleWithNormalButton(backgroundcolor: UIColor, titleName:NSString, titleColor: UIColor, textFont: UIFont) -> UIButton {
        
        let button = UIButton.TDSNormalButton()
        
        button.backgroundColor = backgroundcolor
        
        button.titleLabel?.font = textFont
        
        button.setTitle(titleName as String, for: .normal)
        
        button.setTitleColor(titleColor, for: .normal)
        
        button.titleLabel?.textAlignment = .center
        
        return button
    }
    

    class func createTitleImageButton(title:NSString,textFont:UIFont,titleColor:UIColor, backgroundcolor: UIColor) -> UIButton {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = backgroundcolor
        button.titleLabel?.font = textFont
        button.setTitle(title as String, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.setTitleColor(titleColor.withAlphaComponent(0.8), for: .highlighted)
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0)
        return button
        
    }
    

}




