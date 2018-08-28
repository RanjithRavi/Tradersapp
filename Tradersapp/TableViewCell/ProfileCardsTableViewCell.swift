//
//  ProfileCardsTableViewCell.swift
//  Tradersapp
//
//  Created by Ranjith Ravichandran on 20/06/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import UIKit

class ProfileCardsTableViewCell: UITableViewCell {

    weak var bgView : UIView!

    weak var userTitleLabel : UILabel!
    
    weak var cardsButton : UIButton!

    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        setUpSubViews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpSubViews() {
        
        let view = UIView.shadowView(backgroundColor: UIColor.cloudyBlue15)
        view.layer.cornerRadius = 5.0
        self.contentView .addSubview(view)
        self.bgView = view
        
        let titlelabel = createHorizontalLabel()
        self.userTitleLabel = titlelabel
        self.bgView.addSubview(titlelabel)
        
        let button  = UIButton ()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.textColor = UIColor.white
        button.backgroundColor = UIColor.black
        button .setTitle("x", for: UIControlState.normal)
        button.titleLabel?.font = UIFont.avenirMedium(size: 14)
        button.layer.cornerRadius = 15/2
        self.bgView .addSubview(button)
        self.cardsButton = button

        self.setUpConstraint ()
    }
    
    func setUpConstraint ()  {
        
        //bgView
       self.bgView.superview?.leadingAnchor .constraint(equalTo: self.bgView.leadingAnchor, constant:-20).isActive = true
//        self.bgView.superview?.trailingAnchor .constraint(equalTo: self.bgView.trailingAnchor, constant: 0).isActive = true
        self.bgView.topAnchor.constraint(equalTo: (self.bgView.superview?.topAnchor)!).isActive = true
        self.bgView.superview?.bottomAnchor .constraint(equalTo: self.bgView.bottomAnchor, constant: 0).isActive = true
        self.bgView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        self.bgView.heightAnchor.constraint(equalToConstant: 40).isActive = true

        
        //profileEditNameTextField
        self.userTitleLabel.superview?.leadingAnchor .constraint(equalTo: self.userTitleLabel.leadingAnchor, constant: -10).isActive = true
        self.userTitleLabel.trailingAnchor .constraint(equalTo: self.cardsButton.leadingAnchor, constant: -10).isActive = true
        self.userTitleLabel?.topAnchor.constraint(equalTo: (self.userTitleLabel?.superview?.topAnchor)!, constant: 8).isActive = true
        self.userTitleLabel.superview?.bottomAnchor .constraint(equalTo: self.userTitleLabel.bottomAnchor, constant: 8).isActive = true
        
        self.cardsButton?.topAnchor.constraint(equalTo: (self.cardsButton?.superview?.topAnchor)!, constant: 7).isActive = true
        self.cardsButton?.centerXAnchor.constraint(equalTo: (self.userTitleLabel.centerXAnchor)).isActive = true
        self.cardsButton?.trailingAnchor.constraint(equalTo: (self.cardsButton?.superview?.trailingAnchor)!, constant: -10).isActive = true
        self.cardsButton.heightAnchor .constraint(equalToConstant: 15.0).isActive = true
        self.cardsButton.widthAnchor .constraint(equalToConstant: 15.0).isActive = true

    }

}
