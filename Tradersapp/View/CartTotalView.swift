//
//  CartTotalView.swift
//  Tradersapp
//
//  Created by Ranjith Ravichandran on 03/07/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import UIKit

class CartTotalView: UIView {
    
    weak var subTotal = UILabel()
    
    weak var subTotalDollar = UILabel()
    
    weak var subTotalSeparator = UIView()

    weak var tax = UILabel()
    
    weak var taxDollar = UILabel()
    
    weak var taxSeparator = UIView()
    
    weak var total = UILabel()
    
    weak var totalDollar = UILabel()
    
    weak var totlaSeparator = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setUpSubView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpSubView ()  {
        
        let label1 = normalLabel(textfont: UIFont.avenirLight(size: 12)!, textColor: UIColor.charcoalGrey)
        label1.text = "Sub Total"
        self.addSubview(label1)
        self.subTotal = label1
        
        let label2 = normalLabel(textfont: UIFont.avenirBlack(size: 16)!, textColor: UIColor.charcoalGrey)
        label2.text = "$846"
        self.addSubview(label2)
        self.subTotalDollar = label2
        
        let view1 = UIView.shadowView(backgroundColor: UIColor.lightGray)
        view1.layer.borderWidth = 0.5
        view1.layer.borderColor = UIColor.lightGray.cgColor
        self.addSubview(view1)
        self.subTotalSeparator = view1
        
        let label3 = normalLabel(textfont: UIFont.avenirLight(size: 12)!, textColor: UIColor.charcoalGrey)
        label3.text = "Taxes"
        self.addSubview(label3)
        self.tax = label3
        
        let label4 = normalLabel(textfont: FONT.SEMIBOLD_14, textColor: UIColor.charcoalGrey)
        label4.text = "$0.00"
        self.addSubview(label4)
        self.taxDollar = label4
        
        let view2 = UIView.shadowView(backgroundColor: UIColor.lightGray)
        view2.layer.borderWidth = 0.5
        view2.layer.borderColor = UIColor.lightGray.cgColor
        self.addSubview(view2)
        self.taxSeparator = view2
        
        let label5 = normalLabel(textfont: FONT.MEDIUM_12, textColor: UIColor.charcoalGrey)
        label5.text = "Total"
        self.addSubview(label5)
        self.total = label5
        
        let label6 = normalLabel(textfont: UIFont.avenirBlack(size: 18)!, textColor: UIColor.charcoalGrey)
        label6.text = "$846"
        self.addSubview(label6)
        self.totalDollar = label6
        
        let view3 = UIView.shadowView(backgroundColor: UIColor.clear)
        self.addSubview(view3)
        self.totlaSeparator = view3
        
        self.setUpConstraint()
    }
    
    func setUpConstraint ()  {
        
        self.subTotalDollar?.anchorConstraint(top: self.topAnchor, leading: nil, bottom: self.subTotalSeparator?.topAnchor, trailing: self.trailingAnchor, padding: .init(top: 80, left: 0, bottom: 0, right: 30))
        
        self.subTotal?.anchorConstraint(top: self.topAnchor, leading: nil, bottom: self.subTotalSeparator?.topAnchor, trailing: self.subTotalDollar?.leadingAnchor, padding: .init(top: 80, left: 0, bottom: 0, right: 30))
        
        self.subTotalSeparator?.anchorConstraint(top: nil, leading: nil, bottom: nil, trailing: self.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 5), size: .init(width: 160, height: 0.5))
    
        self.taxDollar?.anchorConstraint(top: self.subTotalSeparator?.topAnchor, leading: nil, bottom: self.taxSeparator?.topAnchor, trailing: self.trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 30))
        
        self.tax?.anchorConstraint(top: self.subTotalSeparator?.topAnchor, leading: nil, bottom: self.taxSeparator?.topAnchor, trailing: self.taxDollar?.leadingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 30))
        
        self.taxSeparator?.anchorConstraint(top: nil, leading: nil, bottom: nil, trailing: self.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 5), size: .init(width: 160, height: 0.5))
        
        self.totalDollar?.anchorConstraint(top: self.taxSeparator?.topAnchor, leading: nil, bottom: self.totlaSeparator?.topAnchor, trailing: self.trailingAnchor, padding: .init(top: 20, left: 0, bottom: 1, right: 30))
        
        self.total?.anchorConstraint(top: self.taxSeparator?.topAnchor, leading: nil, bottom: self.totlaSeparator?.topAnchor, trailing: self.taxDollar?.leadingAnchor, padding: .init(top: 20, left: 0, bottom: 1, right: 30))
        
        self.totlaSeparator?.anchorConstraint(top: nil, leading: nil, bottom: nil, trailing: self.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 5), size: .init(width: 160, height: 0.5))

        
    }
    
}
