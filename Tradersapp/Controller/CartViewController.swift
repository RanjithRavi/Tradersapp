//
//  CartViewController.swift
//  Tradersapp
//
//  Created by Ranjith Ravichandran on 01/07/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class CartViewController: UIViewController, UIScrollViewDelegate {
    
    var itemsArray = [["title":"Bannana ($25 per Bin)","item":"3 Bins", "dollar" :"$126"],
                      ["title":"Bannana ($25 per Bin)","item":"3 Bins", "dollar" :"$126"],
                      ["title":"Bannana ($25 per Bin)","item":"3 Bins", "dollar" :"$126"]]
    
    weak var navigationView = UIView()
    
    weak var sideMenuBtn = UIButton()
    
    weak var titleLabel = UILabel()
    
    weak var bgScroll = UIScrollView()
    
    weak var collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    
    weak var totalView = CartTotalView()
    
    weak var paymentTable  = UITableView()
    
    var paymentArray: NSArray!
    
    var paymentbutton = UIButton()
    
    var deliveryArray: NSArray!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        self.paymentArray = [["title":"Cash"]]
        
        self.deliveryArray = [["title":"Shipping"],
                              ["title":"Drop Off Point"],
                              ["title":"Note to seller"]]
        
        SlideMenuOptions.contentViewScale = 1
        
        setUpSubView()
    }
    
    @objc func pushToTrackView() {
        
        let trackVC = TrackOrderViewController()
        self.navigationController?.pushViewController(trackVC, animated: true)
        
    }

    @objc func leftmenuActn(_ sender: Any) {
        
        self.openLeft()
    }

    func setUpSubView ()  {
        
        let view1 = UIView.shadowView(backgroundColor: UIColor.clear)
        self.view.addSubview(view1)
        self.navigationView = view1
        
        do {
            let btn  = UIButton.TDSNormalButton()
            let image = UIImage(named: "blackmenu.png")
            btn.setImage(image?.withRenderingMode(.alwaysTemplate), for: .normal)
            btn.addTarget(self, action: #selector(leftmenuActn), for: .touchUpInside)
            btn.tintColor = UIColor.black
            self.navigationView?.addSubview(btn)
            self.sideMenuBtn = btn
            
            let label = normalLabel(textfont: UIFont.avenirHeavy(size: 15)!, textColor: UIColor.black)
            label.text = "Add To Cart"
            label.textAlignment = NSTextAlignment.center
            self.navigationView?.addSubview(label)
            self.titleLabel = label
        }
        
        let scroll = UIScrollView.bgScrollView(backgroundColor: UIColor.clear, delegate: self)
        scroll.contentInset = UIEdgeInsetsMake(0, 0, 1000, 0)
        self.view .addSubview(scroll)
        self.bgScroll = scroll    
        
        let collectionViewItem = UICollectionView.cartListCollectionView(delegate: self)
        collectionViewItem.isUserInteractionEnabled = true
        collectionViewItem.register(CartCollectionViewCell.self, forCellWithReuseIdentifier: KCartCollectionViewCellID)
        self.collectionView = collectionViewItem
        self.bgScroll?.addSubview(collectionViewItem)
        
        let view = CartTotalView()
        self.bgScroll?.addSubview(view)
        self.totalView = view
        
        let table = createBasicPlainTableView()
        table.delegate = self
        table.dataSource = self
        table.isScrollEnabled = false
        table.register(CartPaymentTableViewCell.self, forCellReuseIdentifier: KCartPaymentCellID)
        table.separatorStyle = UITableViewCellSeparatorStyle.none
        self.bgScroll?.addSubview(table)
        self.paymentTable = table
        
        let button = UIButton.TDSTitleWithNormalButton(backgroundcolor: UIColor.red, titleName: "Place Order", titleColor: UIColor.white, textFont: UIFont.avenirBlack(size: 18)!)
        button.addTarget(self, action: #selector(pushToTrackView), for: UIControlEvents.touchUpInside)
        self.view .addSubview(button)
        self.paymentbutton = button
        
        
        setUpConstraint()
    }
    
    func setUpConstraint ()  {
        
        self.navigationView?.leadingAnchor .constraint(equalTo: ((self.navigationView?.superview?.leadingAnchor))!).isActive = true
        self.navigationView?.trailingAnchor .constraint(equalTo: ((self.navigationView?.superview?.trailingAnchor))!).isActive = true
        self.navigationView?.topAnchor .constraint(equalTo: (self.navigationView?.superview?.topAnchor)!,constant:0).isActive = true
        self.navigationView?.heightAnchor.constraint(equalToConstant: 54).isActive = true
        
        do {
            self.sideMenuBtn?.anchorConstraint(top: self.navigationView?.topAnchor, leading: self.navigationView?.leadingAnchor, bottom: nil, trailing: nil,padding: .init(top: 32, left: 20, bottom: 0, right: 0),size: .init(width: 20, height: 20))
            
            self.titleLabel?.anchorConstraint(top: self.navigationView?.topAnchor, leading: self.navigationView?.leadingAnchor, bottom: self.navigationView?.bottomAnchor, trailing: self.navigationView?.trailingAnchor,padding: .init(top: 30, left: 0, bottom: 0, right: 0))
            
            self.titleLabel?.centerXAnchor.constraint(equalTo: (self.titleLabel?.superview?.centerXAnchor)!).isActive = true
        }
        
        //self.bgScroll
        self.bgScroll?.leadingAnchor .constraint(equalTo: ((self.bgScroll?.superview?.leadingAnchor))!).isActive = true
        self.bgScroll?.trailingAnchor .constraint(equalTo: ((self.bgScroll?.superview?.trailingAnchor))!).isActive = true
        self.bgScroll?.topAnchor .constraint(equalTo: (self.navigationView?.bottomAnchor)!,constant:30).isActive = true
        self.bgScroll?.bottomAnchor .constraint(equalTo: ((self.bgScroll?.superview?.bottomAnchor))!).isActive = true

        do {
            self.collectionView?.leadingAnchor .constraint(equalTo: ((self.collectionView?.superview?.leadingAnchor))!).isActive = true
            self.collectionView?.trailingAnchor .constraint(equalTo: (self.collectionView?.superview?.trailingAnchor)!,constant:0).isActive = true
            self.collectionView?.topAnchor .constraint(equalTo: (self.collectionView?.superview?.topAnchor)!,constant:0).isActive = true
            self.collectionView?.centerXAnchor .constraint(equalTo: ((self.collectionView?.superview?.centerXAnchor))!).isActive = true
            self.collectionView?.heightAnchor.constraint(equalToConstant: 260).isActive = true

            self.totalView?.anchorConstraint(top: self.collectionView?.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: TDS.SCREEN_WIDTH, height: 150))
            
            self.paymentTable?.anchorConstraint(top: self.totalView?.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 0), size: .init(width: TDS.SCREEN_WIDTH, height: 300))
        }
        
        self.paymentbutton.anchorConstraint(top: nil, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: TDS.SCREEN_WIDTH, height: 50))
        
    }

}

extension CartViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return itemsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KCartCollectionViewCellID, for: indexPath) as! CartCollectionViewCell
        
        var dict = NSDictionary()
        
        dict = self.itemsArray[indexPath.item] as NSDictionary
        
        cell.productTitleLabel?.text = (dict["title"] as! String)
        
        cell.userTitleLabel?.text = (dict["item"] as! String)
        
        cell.dollarLabel?.text = (dict["dollar"] as! String)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width:TDS.SCREEN_WIDTH, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
    }
}

//MARK:- UITableView Delegate & DataSource

extension CartViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
            return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            
             return paymentArray.count
        } else {
            
             return deliveryArray.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: KCartPaymentCellID, for: indexPath) as! CartPaymentTableViewCell
            
            cell.contentView.backgroundColor = UIColor.clear
        
        if indexPath.section == 0 {
            
            var dict = NSDictionary()
            
            dict = self.paymentArray[indexPath.row] as! NSDictionary
            
            cell.paymentLabel?.text = dict["title"] as?  String
        } else {
            
            var dict = NSDictionary()
            
            dict = self.deliveryArray[indexPath.row] as! NSDictionary
            
            cell.paymentLabel?.text = dict["title"] as?  String
            
            if indexPath.row == 0 {
                
                cell.dropDown?.isHidden = false
            } else {
                
                cell.dropDown?.isHidden = true
            }
        }
        
            cell.selectionStyle = UITableViewCellSelectionStyle.none
        
            cell.separatorInset = UIEdgeInsets.zero
        
            return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: TDS.SCREEN_WIDTH , height: 42))
        let titleLabel = UILabel(frame: CGRect(x: 25, y: 19, width: 200 , height: 21))
        titleLabel.font = UIFont.avenirHeavy(size: 16)!
        titleLabel.textColor = UIColor.black
        
        if section == 0 {
            titleLabel.text = "Payment Options"
            
        } else  {
            
            titleLabel.text = "Delivery Options"

        }
        
        view.addSubview(titleLabel)
        return view
            
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
            return 50
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
            return 80
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 20
        
    }
}
