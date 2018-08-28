//
//  ProfileUserTableViewCell.swift
//  Tradersapp
//
//  Created by Ranjith Ravichandran on 19/06/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import UIKit

class ProfileUserTableViewCell: UITableViewCell {

    weak var userTitleLabel : UILabel!
    
    weak var userDetailLabel : UILabel!
    
    weak var seperatorView : UIView!


    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        setUpSubViews()
        
    }
    
    
    
    func setUpSubViews() {
        
        let titlelabel = createNameLabel()
        self.userTitleLabel = titlelabel
        self.contentView.addSubview(titlelabel)
        
        let nameLabel = createUserSubLabel()
        self.userDetailLabel = nameLabel
        self.contentView.addSubview(nameLabel)
        
        let seperator = UIView.shadowView(backgroundColor: UIColor.clear)
        seperator.layer.borderWidth = 1.0
        seperator.layer.borderColor = UIColor.cloudyBlue30.cgColor
        self.contentView .addSubview(seperator)
        self.seperatorView = seperator
        
        
        setUpConstraint ()
    }
    
    func setUpConstraint ()  {
        
        //profileEditNameTextField
        self.userTitleLabel.superview?.leadingAnchor .constraint(equalTo: self.userTitleLabel.leadingAnchor, constant: -25).isActive = true
        self.userTitleLabel.superview?.trailingAnchor .constraint(equalTo: self.userTitleLabel.trailingAnchor, constant: 20).isActive = true
        self.userTitleLabel.topAnchor.constraint(equalTo: (self.userTitleLabel.superview?.topAnchor)!).isActive = true
        
        self.userDetailLabel?.topAnchor.constraint(equalTo: (self.userTitleLabel?.bottomAnchor)!, constant: 0).isActive = true
        self.userDetailLabel?.leadingAnchor.constraint(equalTo: (self.userDetailLabel?.superview?.leadingAnchor)!, constant: 25).isActive = true
        self.userDetailLabel?.trailingAnchor.constraint(equalTo: (self.userDetailLabel?.superview?.trailingAnchor)!, constant: -20).isActive = true

        self.seperatorView?.topAnchor.constraint(equalTo: (self.userDetailLabel?.bottomAnchor)!, constant: 10).isActive = true
        self.seperatorView?.leadingAnchor.constraint(equalTo: (self.seperatorView?.superview?.leadingAnchor)!, constant: 25).isActive = true
        self.seperatorView?.trailingAnchor.constraint(equalTo: (self.seperatorView?.superview?.trailingAnchor)!, constant: -20).isActive = true
        self.seperatorView.superview?.bottomAnchor .constraint(equalTo: self.seperatorView.bottomAnchor, constant: 0).isActive = true
        self.seperatorView.heightAnchor .constraint(equalToConstant: 1.0).isActive = true

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
