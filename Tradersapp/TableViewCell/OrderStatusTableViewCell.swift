//
//  OrderStatusTableViewCell.swift
//  Tradersapp
//
//  Created by Ranjith Ravichandran on 12/08/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import UIKit

let KOrderStatusCellID = "KOrderStatusCellID"

class OrderStatusTableViewCell: UITableViewCell {

    weak var activeStatusView = UIView()
    
    weak var trackOrderStatusLabel = UILabel()
    
    weak var tickImage = UIButton()

    weak var inActiveStatusView = UIView()
    
    weak var activeStatusView1 = UIView()

    weak var inActiveStatusView1 = UIView()

    weak var dateLabel = UILabel()

    weak var userImage = UIButton()

    weak var receivedBtn = UIButton()


    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpSubView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpSubView ()  {
        
        let view = UIView.shadowView(backgroundColor: UIColor.white)
        view.layer.borderColor = UIColor.warmgrey.cgColor
        view.layer.borderWidth = 1.0
        self.contentView.addSubview(view)
        self.activeStatusView = view
        
        let view2 = UIView.shadowView(backgroundColor: UIColor.white)
        view2.layer.borderColor = UIColor.warmgrey.cgColor
        view2.layer.borderWidth = 1.0
        self.contentView.addSubview(view2)
        self.activeStatusView1 = view2
        
        let btn  = UIButton.TDSNormalButton()
        let image = UIImage(named: "check.png")
        btn.setImage(image?.withRenderingMode(.alwaysOriginal), for: .normal)
        self.contentView.addSubview(btn)
        self.tickImage = btn
        
        let view1 = UIView.shadowView(backgroundColor: UIColor.white)
        view1.layer.borderColor = UIColor.warmgrey.cgColor
        view1.layer.borderWidth = 1.0
        self.contentView.addSubview(view1)
        self.inActiveStatusView = view1
        
        let view3 = UIView.shadowView(backgroundColor: UIColor.white)
        view3.layer.borderColor = UIColor.warmgrey.cgColor
        view3.layer.borderWidth = 1.0
        self.contentView.addSubview(view3)
        self.inActiveStatusView1 = view3
        
        let label1 = UILabel()
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.textColor = UIColor.black
        label1.font = UIFont.avenirHeavy(size: 13)!
        self.contentView.addSubview(label1)
        self.trackOrderStatusLabel = label1
        
        let label2 = UILabel()
        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.textColor = UIColor.battleShipGrey
        label2.font = UIFont.avenirBook(size: 10)!
        self.contentView.addSubview(label2)
        self.dateLabel = label2
        
        let btn1  = UIButton.createTitleImageButton(title: "Karen", textFont: UIFont.avenirBlack(size: 10)!, titleColor: UIColor.charcoalGreyThree, backgroundcolor: UIColor.white)
        btn1.setImage(UIImage.init(named: "pencil.png"), for: UIControlState.normal)
        self.contentView.addSubview(btn1)
        self.userImage = btn1
        
        let btn2 = UIButton.TDSTitleWithNormalButton(backgroundcolor: UIColor.mediumGreen, titleName: "Received", titleColor: UIColor.white, textFont: UIFont.avenirHeavy(size: 12)!)
        btn2.layer.cornerRadius = 8
        self.contentView.addSubview(btn2)
        self.receivedBtn = btn2
        
        setUpConstraint ()
    }
   
    func setUpConstraint ()  {
        
        self.activeStatusView?.leadingAnchor .constraint(equalTo: (self.activeStatusView?.superview?.leadingAnchor)!,constant:40).isActive = true
        self.activeStatusView?.widthAnchor .constraint(equalToConstant: 1).isActive = true;
        self.activeStatusView?.heightAnchor .constraint(equalToConstant: 40).isActive = true;
        
        
        self.activeStatusView1?.leadingAnchor .constraint(equalTo: (self.activeStatusView1?.superview?.leadingAnchor)!,constant:40).isActive = true
        self.activeStatusView1?.widthAnchor .constraint(equalToConstant: 1).isActive = true;
        self.activeStatusView1?.heightAnchor .constraint(equalToConstant: 40).isActive = true;
        
        self.tickImage?.centerXAnchor .constraint(equalTo: (self.activeStatusView?.centerXAnchor)!,constant:0).isActive = true
        self.tickImage?.topAnchor .constraint(equalTo: (self.activeStatusView?.bottomAnchor)!,constant:0).isActive = true
        self.tickImage?.widthAnchor .constraint(equalToConstant: 20).isActive = true;
        self.tickImage?.heightAnchor .constraint(equalToConstant: 20).isActive = true;
        self.tickImage?.topAnchor .constraint(equalTo: (self.activeStatusView1?.bottomAnchor)!,constant:10).isActive = true
        
        self.inActiveStatusView?.topAnchor .constraint(equalTo: (self.tickImage?.bottomAnchor)!,constant:0).isActive = true
        self.inActiveStatusView?.leadingAnchor .constraint(equalTo: (self.inActiveStatusView?.superview?.leadingAnchor)!,constant:40).isActive = true
        self.inActiveStatusView?.widthAnchor .constraint(equalToConstant: 1).isActive = true;
        self.inActiveStatusView?.heightAnchor .constraint(equalToConstant: 20).isActive = true;
        
        
        self.inActiveStatusView1?.topAnchor .constraint(equalTo: (self.tickImage?.bottomAnchor)!,constant:10).isActive = true
        self.inActiveStatusView1?.leadingAnchor .constraint(equalTo: (self.inActiveStatusView1?.superview?.leadingAnchor)!,constant:40).isActive = true
        self.inActiveStatusView1?.widthAnchor .constraint(equalToConstant: 1).isActive = true;
        self.inActiveStatusView1?.heightAnchor .constraint(equalToConstant: 20).isActive = true;
        
        
        self.trackOrderStatusLabel?.leadingAnchor .constraint(equalTo: (self.activeStatusView?.trailingAnchor)!,constant:20).isActive = true
        self.trackOrderStatusLabel?.centerXAnchor .constraint(equalTo: (self.trackOrderStatusLabel?.superview?.centerXAnchor)!,constant:0).isActive = true

        self.dateLabel?.topAnchor .constraint(equalTo: (self.trackOrderStatusLabel?.bottomAnchor)!,constant:5).isActive = true
        self.dateLabel?.leadingAnchor .constraint(equalTo: (self.activeStatusView?.trailingAnchor)!,constant:20).isActive = true
        self.dateLabel?.centerXAnchor .constraint(equalTo: (self.trackOrderStatusLabel?.superview?.centerXAnchor)!,constant:0).isActive = true
        self.dateLabel?.bottomAnchor .constraint(equalTo: (self.dateLabel?.superview?.bottomAnchor)!,constant:-15).isActive = true
        
        self.userImage?.trailingAnchor .constraint(equalTo: (self.userImage?.superview?.trailingAnchor)!,constant:-10).isActive = true
        self.userImage?.bottomAnchor .constraint(equalTo: (self.userImage?.superview?.bottomAnchor)!,constant:-10).isActive = true
        self.userImage?.widthAnchor .constraint(equalToConstant: 120).isActive = true;
        self.userImage?.heightAnchor .constraint(equalToConstant: 50).isActive = true;

        
        self.receivedBtn?.trailingAnchor .constraint(equalTo: (self.receivedBtn?.superview?.trailingAnchor)!,constant:-20).isActive = true
        self.receivedBtn?.bottomAnchor .constraint(equalTo: (self.receivedBtn?.superview?.bottomAnchor)!,constant:-10).isActive = true
        self.receivedBtn?.widthAnchor .constraint(equalToConstant: 71).isActive = true;
        self.receivedBtn?.heightAnchor .constraint(equalToConstant: 27).isActive = true;
       
    }
    
}


