//
//  CartPaymentTableViewCell.swift
//  Tradersapp
//
//  Created by Ranjith Ravichandran on 03/07/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import UIKit

let KCartPaymentCellID = "KCartPaymentCellID"

class CartPaymentTableViewCell: UITableViewCell {

    weak var bgView = UIView()
    
    weak var paymentLabel = UILabel()
    
    weak var dropDown = UIButton()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpSubView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpSubView ()  {
        
        let view = UIView.shadowView(backgroundColor: UIColor.white)
        view.layer.cornerRadius = 10.0
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 0.2
        view.clipsToBounds = false
        view.layer.shadowColor = UIColor.black50.cgColor;
        view.layer.shadowOffset = CGSize (width: 0.5, height: 4.0);
        view.layer.shadowRadius = 4;
        view.layer.shadowOpacity = 0.5;
        self.contentView.addSubview(view)
        self.bgView = view
        
        let label = normalLabel(textfont: UIFont.avenirLight(size: 16)!, textColor: UIColor.charcoalGrey)
        label.text = "card"
        self.bgView?.addSubview(label)
        self.paymentLabel = label
        
        let button = UIButton.TDSNormalButton()
        let image = UIImage(named: "sort-down.png")
        button.setImage(image?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = UIColor.lightGray
        self.bgView?.addSubview(button)
        self.dropDown = button
        
        setUpConstraint()
        
    }
    
    func setUpConstraint ()  {
        
        self.bgView?.anchorConstraint(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: contentView.trailingAnchor, padding: .init(top: 0, left: 20, bottom: 0, right: 20), size: .init(width: TDS.SCREEN_WIDTH-20, height: 46))
        
        self.paymentLabel?.anchorConstraint(top: self.bgView?.topAnchor, leading: self.bgView?.leadingAnchor, bottom: self.bgView?.bottomAnchor
            , trailing: nil, padding: .init(top: 5, left: 10, bottom: 5, right: 0))
        
        self.dropDown?.anchorConstraint(top: self.bgView?.topAnchor, leading: nil, bottom: nil, trailing: self.bgView?.trailingAnchor,padding: .init(top: 20, left: 0, bottom: 0, right: 20),size: .init(width: 10, height: 10))
        
    }
}
