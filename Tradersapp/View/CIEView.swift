//
//  CIEView.swift
//  Tradersapp
//
//  Created by Ranjith Ravichandran on 12/08/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import UIKit

class CIEView: UIView {

    weak var chatButton: UIButton!

    weak var invoiceButton: UIButton!

    weak var emailButton: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.backgroundColor = UIColor.clear
        
        setUpSubView ()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpSubView ()  {
        
        let btn  = UIButton.createTitleImageButton(title: "Chat", textFont: UIFont.avenirHeavy(size: 12)!, titleColor: UIColor.darkGreyThree, backgroundcolor: UIColor.white)
        btn.setImage(UIImage.init(named: "pencil.png"), for: UIControlState.normal)
        self.addSubview(btn)
        self.chatButton = btn
        
        let btn1  = UIButton.createTitleImageButton(title: "Invoice", textFont: UIFont.avenirHeavy(size: 12)!, titleColor: UIColor.darkGreyThree, backgroundcolor: UIColor.white)
        btn1.setImage(UIImage.init(named: "pencil.png"), for: UIControlState.normal)
        self.addSubview(btn1)
        self.invoiceButton = btn1
        
        let btn2  = UIButton.createTitleImageButton(title: "Email", textFont: UIFont.avenirHeavy(size: 12)!, titleColor: UIColor.darkGreyThree, backgroundcolor: UIColor.white)
        btn2.setImage(UIImage.init(named: "pencil.png"), for: UIControlState.normal)
        self.addSubview(btn2)
        self.emailButton = btn2
        
        setUpConstraint ()
    }
    
    func setUpConstraint ()  {
        
        self.chatButton?.anchorConstraint(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 0, bottom: 0, right: 20), size: .init(width: 112, height: 40))
        
        
        self.invoiceButton?.anchorConstraint(top: self.topAnchor, leading: self.chatButton.trailingAnchor, bottom: nil, trailing: nil,padding: .init(top: 0, left: 3, bottom: 0, right: 20), size: .init(width: 112, height: 40))
        
        
        self.emailButton?.anchorConstraint(top: self.topAnchor, leading: self.invoiceButton.trailingAnchor, bottom: nil, trailing: self.trailingAnchor,padding: .init(top: 0, left: 3, bottom: 0, right: 0), size: .init(width: 112, height: 40))
        
    }

}
