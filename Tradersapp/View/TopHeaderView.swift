//
//  TopHeaderView.swift
//  Tradersapp
//
//  Created by Ranjith Ravichandran on 12/08/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import UIKit

class TopHeaderView: UIView {

    weak var headerLabel = UILabel()
    
    weak var ratingButton: UIButton!

    weak var trackIdLabel = UILabel()

    weak var orderIdLabel = UILabel()
    
    weak var orderStatusLabel = UILabel()
    
    weak var orderPlacedDateLabel = UILabel()
    
    weak var paymentLabel = UILabel()
    
    weak var invoiceLabel = UILabel()
    
    weak var bottomView = UIView()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.backgroundColor = UIColor.white
        setUpSubView ()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpSubView ()  {
        
        let label = normalLabel(textfont: UIFont.avenirHeavy(size: 16)!, textColor: UIColor.charcoalGreyThree)
        label.text = "Jhon International PTY Ltd"
        label.textAlignment = NSTextAlignment.center
        self.addSubview(label)
        self.headerLabel = label

        let btn  = UIButton.TDSTitleWithNormalButton(backgroundcolor: UIColor.midGreen, titleName: "4.0", titleColor: UIColor.white, textFont: UIFont.avenirHeavy(size: 14)!)
        btn.layer.cornerRadius = 12;
        self.addSubview(btn)
        self.ratingButton = btn
        
        let label1 = UILabel()
        label1.translatesAutoresizingMaskIntoConstraints = false
        let primaryAddress = "Order Id : "
        let secondryAddress = "19"
        let modifiedAddress = topaddressAttributedText(primary: primaryAddress as NSString, secondry: secondryAddress as NSString)
        label1.attributedText = modifiedAddress
        self.addSubview(label1)
        self.trackIdLabel = label1
        
        let label2 = UILabel()
        label2.translatesAutoresizingMaskIntoConstraints = false
        let primaryAddress2 = "Status : "
        let secondryAddress2 = "Placed"
        let modifiedAddress2 = topaddressAttributedText(primary: primaryAddress2 as NSString, secondry: secondryAddress2 as NSString)
        label2.attributedText = modifiedAddress2
        self.addSubview(label2)
        self.orderIdLabel = label2
        
        let label3 = UILabel()
        label3.translatesAutoresizingMaskIntoConstraints = false
        let primaryAddress3 = "Order Via : "
        let secondryAddress3 = "Marketplace"
        let modifiedAddress3 = addressAttributedText(primary: primaryAddress3 as NSString, secondry: secondryAddress3 as NSString)
        label3.attributedText = modifiedAddress3
        self.addSubview(label3)
        self.orderStatusLabel = label3
        
        let label4 = UILabel()
        label4.translatesAutoresizingMaskIntoConstraints = false
        let primaryAddress4 = "Delivery : "
        let secondryAddress4 = "Market Drop-Off"
        let modifiedAddress4 = addressAttributedText(primary: primaryAddress4 as NSString, secondry: secondryAddress4 as NSString)
        label4.attributedText = modifiedAddress4
        self.addSubview(label4)
        self.orderPlacedDateLabel = label4
        
        let label5 = UILabel()
        label5.translatesAutoresizingMaskIntoConstraints = false
        let primaryAddress5 = "Payment : "
        let secondryAddress5 = "Cash"
        let modifiedAddress5 = addressAttributedText(primary: primaryAddress5 as NSString, secondry: secondryAddress5 as NSString)
        label5.attributedText = modifiedAddress5
        self.addSubview(label5)
        self.paymentLabel = label5
        
        let label6 = UILabel()
        label6.translatesAutoresizingMaskIntoConstraints = false
        let primaryAddress6 = "Invoice No : "
        let secondryAddress6 = "11242"
        let modifiedAddress6 = addressAttributedText(primary: primaryAddress6 as NSString, secondry: secondryAddress6 as NSString)
        label6.attributedText = modifiedAddress6
        self.addSubview(label6)
        self.invoiceLabel = label6
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        self.addSubview(view)
        self.bottomView = view
        
        
        setUpConstraint ()
    }
    
    func setUpConstraint ()  {
        
        self.headerLabel?.anchorConstraint(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing:nil ,padding: .init(top: 10, left: 20, bottom: 0, right: 0))
        
        self.ratingButton?.anchorConstraint(top: self.topAnchor, leading: nil, bottom: nil, trailing: self.trailingAnchor,padding: .init(top: 20, left: 0, bottom: 0, right: 20), size: .init(width: 58, height: 24))

        self.trackIdLabel?.anchorConstraint(top: self.headerLabel?.bottomAnchor, leading: self.leadingAnchor, bottom: nil, trailing: nil,padding: .init(top: 0, left: 20, bottom: 0, right: 0))
        
        self.orderIdLabel?.anchorConstraint(top: self.headerLabel?.bottomAnchor, leading: self.trackIdLabel?.trailingAnchor, bottom: nil, trailing: nil,padding: .init(top: 0, left: 60, bottom: 0, right: 0))
        
        self.orderStatusLabel?.anchorConstraint(top: self.trackIdLabel?.bottomAnchor, leading: self.trackIdLabel?.leadingAnchor, bottom: nil, trailing: nil,padding: .init(top: 10, left: 0, bottom: 0, right: 0))
        
        self.paymentLabel?.anchorConstraint(top: self.orderIdLabel?.bottomAnchor, leading: self.orderStatusLabel?.trailingAnchor, bottom: nil, trailing: nil,padding: .init(top: 10, left: 40, bottom: 0, right: 0))
        
        self.orderPlacedDateLabel?.anchorConstraint(top: self.orderStatusLabel?.bottomAnchor, leading: self.trackIdLabel?.leadingAnchor, bottom: nil, trailing: nil,padding: .init(top: 5, left: 0, bottom: 0, right: 0))
        
        self.invoiceLabel?.anchorConstraint(top: self.paymentLabel?.bottomAnchor, leading: self.orderPlacedDateLabel?.trailingAnchor, bottom: nil, trailing: nil,padding: .init(top: 5, left: 30, bottom: 0, right: 0))
        
        self.bottomView?.anchorConstraint(top: self.orderPlacedDateLabel?.bottomAnchor, leading: nil, bottom: self.bottomAnchor, trailing:nil ,padding: .init(top: 10, left: 0, bottom: 0, right: 0), size: .init(width: 54, height: 20))
    }
    
    func topaddressAttributedText(primary:NSString, secondry:NSString) -> NSMutableAttributedString {
        
        var addressString = primary
        addressString = String(format: "%@", addressString) as NSString
        
        let attributedAddressString = NSAttributedString(string: addressString as String, attributes: [NSAttributedStringKey.font: UIFont.avenirHeavy(size: 14)!,NSAttributedStringKey.foregroundColor: UIColor.battleShipGrey])
        let cityString = secondry
        let attributedCityString = NSAttributedString(string: cityString as String, attributes: [NSAttributedStringKey.font: UIFont.avenirLight(size: 14)!,NSAttributedStringKey.foregroundColor: UIColor.battleShipGrey])
        let combination = NSMutableAttributedString()
        combination.append(attributedAddressString)
        combination.append(attributedCityString)
        return combination
        
    }
    
    func addressAttributedText(primary:NSString, secondry:NSString) -> NSMutableAttributedString {
        
        var addressString = primary
        addressString = String(format: "%@", addressString) as NSString
        
        let attributedAddressString = NSAttributedString(string: addressString as String, attributes: [NSAttributedStringKey.font: UIFont.avenirHeavy(size: 10)!,NSAttributedStringKey.foregroundColor: UIColor.coolGrey])
        let cityString = secondry
        let attributedCityString = NSAttributedString(string: cityString as String, attributes: [NSAttributedStringKey.font: UIFont.avenirBook(size: 10)!,NSAttributedStringKey.foregroundColor: UIColor.battleShipGrey])
        let combination = NSMutableAttributedString()
        combination.append(attributedAddressString)
        combination.append(attributedCityString)
        return combination
        
    }

}
