//
//  TrackView.swift
//  Tradersapp
//
//  Created by Ranjith Ravichandran on 05/07/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import UIKit

class TrackView: UIView {
    
    weak var trackIdLabel = UILabel()
    
    weak var orderIdLabel = UILabel()
    
    weak var orderStatusLabel = UILabel()
    
    weak var orderPlacedDateLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        setUpSubView ()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpSubView ()  {
        
        let label1 = UILabel()
        label1.translatesAutoresizingMaskIntoConstraints = false
        let primaryAddress = "Transaction Id : "
        let secondryAddress = "ABRS41104113S"
        let modifiedAddress = addressAttributedText(primary: primaryAddress as NSString, secondry: secondryAddress as NSString)
        label1.attributedText = modifiedAddress
        self.addSubview(label1)
        self.trackIdLabel = label1
        
        let label2 = UILabel()
        label2.translatesAutoresizingMaskIntoConstraints = false
        let primaryAddress2 = "Order Id  : "
        let secondryAddress2 = "15"
        let modifiedAddress2 = addressAttributedText(primary: primaryAddress2 as NSString, secondry: secondryAddress2 as NSString)
        label2.attributedText = modifiedAddress2
        self.addSubview(label2)
        self.orderIdLabel = label2
        
        let label3 = UILabel()
        label3.translatesAutoresizingMaskIntoConstraints = false
        let primaryAddress3 = "Order Status  : "
        let secondryAddress3 = "Placed"
        let modifiedAddress3 = addressAttributedText(primary: primaryAddress3 as NSString, secondry: secondryAddress3 as NSString)
        label3.attributedText = modifiedAddress3
        self.addSubview(label3)
        self.orderStatusLabel = label3
        
        let label4 = UILabel()
        label4.translatesAutoresizingMaskIntoConstraints = false
        let primaryAddress4 = "Order Placed Date : "
        let secondryAddress4 = "24th July 2018, 7.30 Am"
        let modifiedAddress4 = addressAttributedText(primary: primaryAddress4 as NSString, secondry: secondryAddress4 as NSString)
        label4.attributedText = modifiedAddress4
        self.addSubview(label4)
        self.orderPlacedDateLabel = label4
        
        setUpConstraint ()
    }
    
    func setUpConstraint ()  {
        
        self.trackIdLabel?.anchorConstraint(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor,padding: .init(top: 10, left: 30, bottom: 0, right: 30))
        self.trackIdLabel?.centerXAnchor.constraint(equalTo: (self.trackIdLabel?.superview?.centerXAnchor)!).isActive = true
        
        self.orderIdLabel?.anchorConstraint(top: self.trackIdLabel?.bottomAnchor, leading: self.trackIdLabel?.leadingAnchor, bottom: nil, trailing: self.trackIdLabel?.trailingAnchor,padding: .init(top: 5, left: 30, bottom: 0, right: 5))
        self.orderIdLabel?.centerXAnchor.constraint(equalTo: (self.orderIdLabel?.superview?.centerXAnchor)!).isActive = true

        self.orderStatusLabel?.anchorConstraint(top: self.orderIdLabel?.bottomAnchor, leading: self.trackIdLabel?.leadingAnchor, bottom: nil, trailing: self.trackIdLabel?.trailingAnchor,padding: .init(top: 5, left: 5, bottom: 0, right: 5))
        self.orderStatusLabel?.centerXAnchor.constraint(equalTo: (self.orderStatusLabel?.superview?.centerXAnchor)!).isActive = true

        self.orderPlacedDateLabel?.anchorConstraint(top: self.orderStatusLabel?.bottomAnchor, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor,padding: .init(top: 5, left: 5, bottom: 0, right: 5))
        self.orderPlacedDateLabel?.centerXAnchor.constraint(equalTo: (self.orderPlacedDateLabel?.superview?.centerXAnchor)!).isActive = true
    }
    
    func addressAttributedText(primary:NSString, secondry:NSString) -> NSMutableAttributedString {
        
        var addressString = primary
        addressString = String(format: "%@", addressString) as NSString
        
        let attributedAddressString = NSAttributedString(string: addressString as String, attributes: [NSAttributedStringKey.font: UIFont.avenirBlack(size: 14)!,NSAttributedStringKey.foregroundColor: UIColor.charcoalGrey2])
        let cityString = secondry
        let attributedCityString = NSAttributedString(string: cityString as String, attributes: [NSAttributedStringKey.font: UIFont.avenirBook(size: 14)!,NSAttributedStringKey.foregroundColor: UIColor.lightGray])
        let combination = NSMutableAttributedString()
        combination.append(attributedAddressString)
        combination.append(attributedCityString)
        return combination
        
    }
    
}
