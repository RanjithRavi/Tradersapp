//
//  CartCollectionViewCell.swift
//  Tradersapp
//
//  Created by Ranjith Ravichandran on 01/07/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import UIKit

let KCartCollectionViewCellID = "KCartCollectionViewCellID"

class CartCollectionViewCell: UICollectionViewCell {
    
    weak var bgShadowView = UIView()
    
    weak var productImage = UIImageView()
    
    weak var productTitleLabel = UILabel()
    
    weak var userTitleLabel : UILabel!
    
    weak var cardsButton : UIButton!

    weak var dollarLabel = UILabel()
    
    weak var cancelView = UIView()
    
    weak var sepeartor = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpSubView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpSubView ()  {
        
        let view = UIView.shadowView(backgroundColor: UIColor.clear)
        self.contentView .addSubview(view)
        self.bgShadowView = view
        
        do {
            let image = UIImageView.TDSimageView(imageName: "blur-business-dark-920570.jpg")
            image.layer.cornerRadius = 8.0
            image.clipsToBounds = true
            self.bgShadowView?.addSubview(image)
            self.productImage = image
            
            let view = UIView.shadowView(backgroundColor: UIColor.clear)
            self.bgShadowView?.addSubview(view)
            self.cancelView = view
            
            let label = normalLabel(textfont: UIFont.avenirLight(size: 12)!, textColor: UIColor.black)
            label.text = "Bannana ($25 per Bin)"
            self.cancelView?.addSubview(label)
            self.productTitleLabel = label
            
            let titlelabel = normalLabel(textfont: UIFont.avenirHeavy(size: 12)!, textColor: UIColor.black)
            titlelabel.text = "3 Bins"
            self.userTitleLabel = titlelabel
            self.cancelView?.addSubview(titlelabel)
            
            let button  = UIButton.TDSNormalButton()
            button.setImage(UIImage(named: "x-button.png"), for: .normal)
            button.layer.cornerRadius = 10/2
            self.cancelView?.addSubview(button)
            self.cardsButton = button

            let lab = normalLabel(textfont: UIFont.avenirBlack(size: 18)!, textColor: UIColor.charcoalGrey)
            lab.text = "$360"
            self.bgShadowView?.addSubview(lab)
            self.dollarLabel = lab
           
        }
        
        let sView = UIView.shadowView(backgroundColor: UIColor.clear)
        sView.layer.borderWidth = 0.5
        sView.layer.borderColor = UIColor.black.cgColor
        self.contentView.addSubview(sView)
        self.sepeartor = sView
        
        
        setUpConstraint()
        
    }
    
    @objc func cancelAction() {
        
        
    }
    
    func setUpConstraint ()  {
        
        self.bgShadowView?.anchorConstraint(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: contentView.trailingAnchor,padding: .init(top: 0, left: 10, bottom: 0, right: 10))
        
        self.productImage?.anchorConstraint(top: self.bgShadowView?.topAnchor, leading: self.bgShadowView?.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 8, left: 10, bottom: 0, right: 0),size: .init(width: 60, height: 60))
        
        self.cancelView?.anchorConstraint(top: self.bgShadowView?.topAnchor, leading: self.productImage?.trailingAnchor, bottom: contentView.bottomAnchor, trailing: nil,padding: .init(top: 10, left: 10, bottom: 10, right: 0), size: .init(width: 200, height: 30))
        
        self.productTitleLabel?.anchorConstraint(top: self.cancelView?.topAnchor, leading: self.cancelView?.leadingAnchor, bottom: nil, trailing: nil,padding: .init(top: 10, left: 0, bottom: 0, right: 0))
        
        self.userTitleLabel?.anchorConstraint(top: self.productTitleLabel?.bottomAnchor, leading: self.productTitleLabel?.leadingAnchor, bottom: nil, trailing: nil,padding: .init(top: 5, left: 0, bottom: 0, right: 0))
        
        self.cardsButton?.anchorConstraint(top: self.productTitleLabel?.bottomAnchor, leading: self.userTitleLabel.trailingAnchor, bottom: nil, trailing: nil,padding: .init(top: 5, left: 5, bottom: 0, right: 0),size: .init(width: 10, height: 10))
        
        self.dollarLabel?.anchorConstraint(top: self.bgShadowView?.topAnchor, leading: nil, bottom: nil, trailing: self.bgShadowView?.trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 20))
        
        self.sepeartor?.anchorConstraint(top: self.bgShadowView?.bottomAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor,padding: .init(top: 0, left: 10, bottom: 0, right: 10),size: .init(width: TDS.SCREEN_WIDTH, height: 0.5))

    }
    
}




