//
//  TrackOrderViewController.swift
//  Tradersapp
//
//  Created by Ranjith Ravichandran on 05/07/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import UIKit

class TrackOrderViewController: UIViewController {
    
    weak var navigationView = UIView()
    
    weak var sideMenuBtn = UIButton()
    
    weak var titleLabel = UILabel()
    
    weak var tickImage = UIImageView()
    
    weak var orderPlacedTitle = UILabel()
    
    var trackOrderView = TrackView()
    
    var trackOrderbutton = UIButton()


    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        setUpSubView ()

    }
    
    @objc func leftmenuActn(_ sender: Any) {
        
        //self.openLeft()
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func pushtotrack() {
        
        let order = OrderStatusViewController()
        self.navigationController?.present(order, animated: true, completion: nil)
        
    }

    func setUpSubView ()  {
        
        let view1 = UIView.shadowView(backgroundColor: UIColor.clear)
        self.view.addSubview(view1)
        self.navigationView = view1
        
        do {
            let btn  = UIButton.TDSNormalButton()
            let image = UIImage(named: "blackback.png")
            btn.setImage(image?.withRenderingMode(.alwaysTemplate), for: .normal)
            btn.tintColor = UIColor.black
            btn.addTarget(self, action: #selector(leftmenuActn), for: .touchUpInside)
            self.navigationView?.addSubview(btn)
            self.sideMenuBtn = btn
            
            let label = normalLabel(textfont: UIFont.avenirHeavy(size: 15)!, textColor: UIColor.black)
            label.text = "Add To Cart"
            label.textAlignment = NSTextAlignment.center
            self.navigationView?.addSubview(label)
            self.titleLabel = label
        }
        
        let image = UIImageView.TDSimageView(imageName: "checked-2.png")
        self.view?.addSubview(image)
        self.tickImage = image
        
        let label1 = normalLabel(textfont: UIFont.avenirBlack(size: 25)!, textColor: UIColor.charcoalGrey2)
        label1.text = "Order Placed Succesfully"
        label1.textAlignment = NSTextAlignment.center
        self.view?.addSubview(label1)
        self.orderPlacedTitle = label1
        
        let orderView = TrackView()
        self.view?.addSubview(orderView)
        self.trackOrderView = orderView
        
        let button = UIButton.TDSTitleWithNormalButton(backgroundcolor: UIColor.red, titleName: "Track Order", titleColor: UIColor.white, textFont: UIFont.avenirBlack(size: 18)!)
       button.addTarget(self, action: #selector(pushtotrack), for: UIControlEvents.touchUpInside)
        self.view .addSubview(button)
        self.trackOrderbutton = button
        
        
        setUpConstraint()
    }
    
    func setUpConstraint ()  {
        
        let width = UIScreen.main.bounds.width-30
        
        self.navigationView?.leadingAnchor .constraint(equalTo: ((self.navigationView?.superview?.leadingAnchor))!).isActive = true
        self.navigationView?.trailingAnchor .constraint(equalTo: ((self.navigationView?.superview?.trailingAnchor))!).isActive = true
        self.navigationView?.topAnchor .constraint(equalTo: (self.navigationView?.superview?.topAnchor)!,constant:0).isActive = true
        self.navigationView?.heightAnchor.constraint(equalToConstant: 54).isActive = true
        
        do {
            self.sideMenuBtn?.anchorConstraint(top: self.navigationView?.topAnchor, leading: self.navigationView?.leadingAnchor, bottom: nil, trailing: nil,padding: .init(top: 30, left: 20, bottom: 0, right: 0),size: .init(width: 24, height: 24))
            
            self.titleLabel?.anchorConstraint(top: self.navigationView?.topAnchor, leading: self.navigationView?.leadingAnchor, bottom: self.navigationView?.bottomAnchor, trailing: self.navigationView?.trailingAnchor,padding: .init(top: 30, left: 0, bottom: 0, right: 0))
            
            self.titleLabel?.centerXAnchor.constraint(equalTo: (self.titleLabel?.superview?.centerXAnchor)!).isActive = true
        }
        
        self.tickImage?.anchorConstraint(top: view.topAnchor, leading: nil, bottom: nil, trailing: nil,padding: .init(top: 150, left: 0, bottom: 0, right: 0),size: .init(width: 120, height: 120))
        
        self.tickImage?.centerXAnchor.constraint(equalTo: (self.tickImage?.superview?.centerXAnchor)!).isActive = true

        self.orderPlacedTitle?.anchorConstraint(top: self.tickImage?.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor,padding: .init(top: 30, left: 30, bottom: 0, right: 10))
        
        self.orderPlacedTitle?.centerXAnchor.constraint(equalTo: (self.orderPlacedTitle?.superview?.centerXAnchor)!).isActive = true
        
        self.trackOrderView.anchorConstraint(top: self.orderPlacedTitle?.bottomAnchor, leading: self.orderPlacedTitle?.leadingAnchor, bottom: self.trackOrderbutton.topAnchor, trailing: self.orderPlacedTitle?.trailingAnchor,padding: .init(top: 5, left: 10, bottom: 100, right: 10),size: .init(width: width, height: 80))
        
        self.trackOrderbutton.anchorConstraint(top: nil, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: TDS.SCREEN_WIDTH, height: 50))
    }
    
}
