//
//  Label.swift
//  Tradersapp
//
//  Created by Ranjith Ravichandran on 19/06/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import Foundation

import UIKit

func fontSize(ratio:CGFloat) -> CGFloat {
    
    let fontSize = TDS.SCREEN_WIDTH * ratio
    
    return fontSize
    
}

func basicLabel(backgroundcolor: UIColor, textColor:UIColor, textFont:UIFont) -> UILabel {
    
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.backgroundColor = backgroundcolor
    label.textColor = textColor
    label.font = textFont
    return label
    
}


func createNameLabel() -> UILabel {
    
    let label = basicLabel(backgroundcolor: UIColor.clear,
                           textColor:UIColor.charcoalGreyThree,
                           textFont:UIFont.avenirLight(size: 12)!)
    
    return label
    
}

func createUserDetailLabel() -> UILabel {
    
    let label = basicLabel(backgroundcolor: UIColor.clear,
                           textColor:UIColor.charcoalGrey,
                           textFont:UIFont.avenirLight(size: 14)!)
    
    return label
    
}

func createUserSubLabel() -> UILabel {
    
    let label = basicLabel(backgroundcolor: UIColor.clear,
                           textColor:UIColor.black,
                           textFont:UIFont.avenirMedium(size: 14)!)
    
    return label
    
}

func createHorizontalLabel() -> UILabel {
    
    let label = basicLabel(backgroundcolor: UIColor.clear,
                           textColor:UIColor.black,
                           textFont:UIFont.avenirMedium(size: 12)!)
    
    return label
    
}

func normalLabel(textfont:UIFont, textColor: UIColor) -> UILabel {
    
    let label = basicLabel(backgroundcolor: UIColor.clear,
                           textColor:textColor,
                           textFont:textfont)
    
    return label
    
}
