//
//  ProfileTopView.swift
//  Tradersapp
//
//  Created by Ranjith Ravichandran on 18/06/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import UIKit

class ProfileTopView: UIView {

    weak var bannerImage : UIImageView!
    
    weak var photoEditView : UIView!
    
    weak var userImage : UIImageView!
    
    weak var photoEditButton : UIButton!
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        
        setUpViews()
        
    }
    
    
    func setUpViews ()  {
        
        let image  = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = UIViewContentMode.scaleAspectFill
        image.clipsToBounds = true
        image.image = UIImage.init(named: "abundance-apples-blur-349730.jpg")
        image.backgroundColor = UIColor.black
        self .addSubview(image)
        self.bannerImage = image
        
        let editView = UIView.shadowView(backgroundColor: UIColor.white)
        editView.layer.cornerRadius = 110/2
        self .addSubview(editView)
        self.photoEditView = editView
        
        
        let profile  = UIImageView()
        profile.translatesAutoresizingMaskIntoConstraints = false
        profile.contentMode = UIViewContentMode.scaleAspectFill
        profile.clipsToBounds = true
        profile.backgroundColor = UIColor.white
        profile.image = UIImage.init(named: "test imge.png")
        profile.layer.cornerRadius = 105/2
        profile.layer.borderWidth = 1.0
        self.photoEditView .addSubview(profile)
        self.userImage = profile
        
        let button  = UIButton ()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.white
        button .setImage(UIImage.init(named: "pencil.png"), for: UIControlState.normal)
        button.tintColor = UIColor.white
        button.layer.cornerRadius = 20/2
        self.photoEditView .addSubview(button)
        self.photoEditButton = button

        
        self.setUpConstraint()
        
    }
    
    func setUpConstraint ()  {
        
        //self.bannerImage
        self.bannerImage.leadingAnchor .constraint(equalTo: (self.bannerImage.superview?.leadingAnchor)!).isActive = true
        self.bannerImage.trailingAnchor .constraint(equalTo: (self.bannerImage.superview?.trailingAnchor)!).isActive = true
        self.bannerImage.topAnchor .constraint(equalTo: (self.bannerImage.superview?.topAnchor)!).isActive = true
        self.bannerImage.bottomAnchor .constraint(equalTo: (self.bannerImage.superview?.bottomAnchor)!).isActive = true
        self.bannerImage.heightAnchor .constraint(equalToConstant: 185.0).isActive = true
        
        //self.photoEditView
        self.photoEditView.centerXAnchor .constraint(equalTo: (self.photoEditView.superview?.centerXAnchor)!).isActive = true
        self.photoEditView.topAnchor .constraint(equalTo: (self.bannerImage.bottomAnchor), constant: -80).isActive = true
        self.photoEditView.heightAnchor .constraint(equalToConstant: 110.0).isActive = true
        self.photoEditView.widthAnchor .constraint(equalToConstant: 110.0).isActive = true
        
        //self.userImage
        self.userImage.centerXAnchor .constraint(equalTo: (self.userImage.superview?.centerXAnchor)!).isActive = true
        self.userImage.topAnchor .constraint(equalTo: (self.userImage.superview?.topAnchor)!, constant: 2).isActive = true
        self.userImage.bottomAnchor .constraint(equalTo: (self.userImage.superview?.bottomAnchor)!, constant: -5).isActive = true
        self.userImage.heightAnchor .constraint(equalToConstant: 105.0).isActive = true
        self.userImage.widthAnchor .constraint(equalToConstant: 105.0).isActive = true
        
        //self.photoEditButton
        self.photoEditButton.trailingAnchor .constraint(equalTo: (self.photoEditButton.superview?.trailingAnchor)!, constant: -25).isActive = true
        self.photoEditButton.topAnchor .constraint(equalTo: (self.photoEditButton.superview?.topAnchor)!, constant: 0).isActive = true
        self.photoEditButton.heightAnchor .constraint(equalToConstant: 20.0).isActive = true
        self.photoEditButton.widthAnchor .constraint(equalToConstant: 20.0).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
