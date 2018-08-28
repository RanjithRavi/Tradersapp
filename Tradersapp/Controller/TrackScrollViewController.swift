//
//  TrackScrollViewController.swift
//  Tradersapp
//
//  Created by Ranjith Ravichandran on 12/08/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import UIKit

class TrackScrollViewController: UIViewController,UIScrollViewDelegate {

    var itemsArray = [["title":"Bannana ($25 per Bin)","item":"3 Bins", "dollar" :"$126"],
                      ["title":"Bannana ($25 per Bin)","item":"3 Bins", "dollar" :"$126"],
                      ["title":"Bannana ($25 per Bin)","item":"3 Bins", "dollar" :"$126"]]
    
    var orderStatusArray = [["title":"Order Placed","item":"24th July 2018, 7.00 pm"],
                      ["title":"Order Approved","item":"24th July 2018, 7.00 pm"],
                      ["title":"Paid/ Credit Approved","item":"24th July 2018, 7.00 pm"],
                      ["title":"Packed","item":"24th July 2018, 7.00 pm"],
                      ["title":"Dropped Off","item":"24th July 2018, 7.00 pm"],
                      ["title":"Order Received"],
                      ["title":"Credit Payment Done"],
                      ["title":"Closed"]]
    
    
    weak var bgImage = UIImageView()
    
    weak var crossBtn = UIButton()
    
    weak var titleLabel = UILabel()
    
    weak var scrollView = UIScrollView()
    
    weak var bgView = UIView()

    var headerView = TopHeaderView()
    
    var middleView = CIEView()
    
    weak var collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    
    weak var totalView = CartTotalView()
    
    weak var trackScrollTable  = UITableView()

    weak var tableViewTop: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpSubView ()
        
        self.view.backgroundColor = UIColor.white
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let scrollOffset = scrollView.contentOffset.y
        
        if(scrollOffset > 96) {
            
            self.tableViewTop.constant = 0
            
        } else {
            
            self.tableViewTop.constant = 220
        }
        
    }
    
    @objc func dismissButtonAction() {
        
        dismiss(animated: true, completion: nil)
    }
    
    
    func setUpSubView ()  {
        
        let image = UIImageView.TDSimageView(imageName: "bg.jpg")
        image.isUserInteractionEnabled = true
        self.view?.addSubview(image)
        self.bgImage = image
        
        let label = normalLabel(textfont: UIFont.avenirHeavy(size: 16)!, textColor: UIColor.white)
        label.text = "Track Order"
        label.textAlignment = NSTextAlignment.center
        self.bgImage?.addSubview(label)
        self.titleLabel = label
        
        let button  = UIButton.TDSNormalButton()
        button.setImage(UIImage(named: "x-button.png"), for: .normal)
        button.layer.cornerRadius = 24/2
        button.addTarget(self, action: #selector(dismissButtonAction), for: .touchUpInside)
        self.bgImage?.addSubview(button)
        self.crossBtn = button
     
        let scrollViewItem = UIScrollView.bgScrollView(backgroundColor: UIColor.clear, delegate: self)
        scrollViewItem.contentInset = UIEdgeInsetsMake(0, 0, 100, 0)
        self.view?.addSubview(scrollViewItem)
        scrollViewItem .bringSubview(toFront: self.bgImage!)
        self.scrollView = scrollViewItem
        
        let vc = UIView()
        vc.translatesAutoresizingMaskIntoConstraints = false
        vc.backgroundColor = UIColor.whiteThree
        self.scrollView?.addSubview(vc)
        self.bgView = vc
        
        let view = TopHeaderView()
        view.backgroundColor = UIColor .white;
        let path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: TDS.SCREEN_WIDTH, height:TDS.SCREEN_HEIGHT),
                                byRoundingCorners: [.topRight, .topLeft],
                                cornerRadii: CGSize(width: 20, height:  20))
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        view.layer.mask = maskLayer
        self.scrollView?.addSubview(view)
        self.headerView = view
       
        let view1 = CIEView()
        self.scrollView?.addSubview(view1)
        self.middleView = view1
        
        let collectionViewItem = UICollectionView.cartListCollectionView(delegate: self)
        collectionViewItem.isUserInteractionEnabled = true
        collectionViewItem.register(CartCollectionViewCell.self, forCellWithReuseIdentifier: KCartCollectionViewCellID)
        self.scrollView?.addSubview(collectionViewItem)
        self.collectionView = collectionViewItem

        let view2 = CartTotalView()
        self.scrollView?.addSubview(view2)
        self.totalView = view2

        
         let table = createBasicPlainTableView()
         table.delegate = self
         table.dataSource = self
         table.isScrollEnabled = false
         table.register(OrderStatusTableViewCell.self, forCellReuseIdentifier: KOrderStatusCellID)
         table.separatorStyle = UITableViewCellSeparatorStyle.none
         table.backgroundColor = UIColor.white;
         self.scrollView?.addSubview(table)
         self.trackScrollTable = table
 
        
        setUpConstraint ()
    }

    func setUpConstraint ()  {
        
        self.bgImage?.leadingAnchor .constraint(equalTo: ((self.bgImage?.superview?.leadingAnchor))!).isActive = true
        self.bgImage?.trailingAnchor .constraint(equalTo: ((self.bgImage?.superview?.trailingAnchor))!).isActive = true
        self.bgImage?.topAnchor .constraint(equalTo: (self.bgImage?.superview?.topAnchor)!,constant:0).isActive = true
        self.bgImage?.bottomAnchor .constraint(equalTo: (self.bgImage?.superview?.bottomAnchor)!,constant:-200).isActive = true

        self.titleLabel?.anchorConstraint(top: self.titleLabel?.superview?.topAnchor, leading: self.titleLabel?.superview?.leadingAnchor, bottom: nil, trailing: nil,padding: .init(top: 30, left: 0, bottom: 0, right: 0))
        self.titleLabel?.centerXAnchor.constraint(equalTo: (self.titleLabel?.superview?.centerXAnchor)!).isActive = true
        
        self.crossBtn?.anchorConstraint(top: self.crossBtn?.superview?.topAnchor, leading: nil, bottom: nil, trailing: self.crossBtn?.superview?.trailingAnchor,padding: .init(top: 30, left: 0, bottom: 0, right: 20),size: .init(width: 24, height: 24))
        
        self.tableViewTop = self.scrollView?.topAnchor.constraint(equalTo: ((self.scrollView?.superview?.topAnchor))!,constant:200)
        self.tableViewTop?.isActive = true
        self.scrollView?.leadingAnchor .constraint(equalTo: ((self.scrollView?.superview?.leadingAnchor))!).isActive = true
        self.scrollView?.trailingAnchor .constraint(equalTo: ((self.scrollView?.superview?.trailingAnchor))!).isActive = true
        self.scrollView?.bottomAnchor .constraint(equalTo: (self.scrollView?.superview?.bottomAnchor)!,constant:0).isActive = true
        self.scrollView?.heightAnchor.constraint(equalToConstant: 400).isActive = true;
        
        self.bgView?.leadingAnchor .constraint(equalTo: ((self.bgView?.superview?.leadingAnchor))!).isActive = true
        self.bgView?.trailingAnchor .constraint(equalTo: ((self.bgView?.superview?.trailingAnchor))!).isActive = true
        self.bgView?.topAnchor .constraint(equalTo: (self.bgView?.superview?.topAnchor)!,constant:30).isActive = true
        self.bgView?.bottomAnchor .constraint(equalTo: (self.bgView?.superview?.bottomAnchor)!,constant:0).isActive = true
        
        self.headerView.leadingAnchor .constraint(equalTo: ((self.headerView.superview?.leadingAnchor))!).isActive = true
        self.headerView.trailingAnchor .constraint(equalTo: ((self.headerView.superview?.trailingAnchor))!).isActive = true
        self.headerView.topAnchor .constraint(equalTo: (self.headerView.superview?.topAnchor)!,constant:0).isActive = true
        self.headerView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        self.headerView.centerXAnchor .constraint(equalTo: ((self.headerView.superview?.centerXAnchor))!).isActive = true

        self.middleView.anchorConstraint(top: self.headerView.bottomAnchor, leading: self.headerView.superview?.leadingAnchor, bottom: nil, trailing: self.headerView.superview?.trailingAnchor, padding: .init(top: 2, left: 1, bottom: 0, right: 1))

        do {
            self.collectionView?.leadingAnchor .constraint(equalTo: ((self.collectionView?.superview?.leadingAnchor))!).isActive = true
            self.collectionView?.trailingAnchor .constraint(equalTo: (self.collectionView?.superview?.trailingAnchor)!,constant:0).isActive = true
            self.collectionView?.topAnchor .constraint(equalTo: (self.middleView.bottomAnchor),constant:50).isActive = true
            self.collectionView?.heightAnchor.constraint(equalToConstant: 260).isActive = true

            self.totalView?.anchorConstraint(top: self.collectionView?.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: TDS.SCREEN_WIDTH, height: 150))
        }
        
        self.trackScrollTable?.leadingAnchor .constraint(equalTo: ((self.trackScrollTable?.superview?.leadingAnchor))!,constant:0).isActive = true
        self.trackScrollTable?.trailingAnchor .constraint(equalTo: (self.trackScrollTable?.superview?.trailingAnchor)!,constant:0).isActive = true
        self.trackScrollTable?.topAnchor .constraint(equalTo: (self.totalView?.bottomAnchor)!,constant:50).isActive = true
        self.trackScrollTable?.bottomAnchor .constraint(equalTo: (self.trackScrollTable?.superview?.bottomAnchor)!,constant:0).isActive = true
        self.trackScrollTable?.heightAnchor.constraint(equalToConstant: 750).isActive = true
    }

}

extension TrackScrollViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
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
        
        cell.bgShadowView?.layer.cornerRadius = 10.0
        
        cell.bgShadowView?.backgroundColor = UIColor.white
                
        cell.sepeartor?.isHidden = true
        
        cell.cardsButton.isHidden = true
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width:TDS.SCREEN_WIDTH, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
    }
}

//MARK:- UITableView Delegate & DataSource

extension TrackScrollViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.orderStatusArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: KOrderStatusCellID, for: indexPath) as! OrderStatusTableViewCell
        
        cell.contentView.backgroundColor = UIColor.clear
        
        var dict = NSDictionary()

        dict = self.orderStatusArray[indexPath.row] as NSDictionary
        
        if (indexPath.row == 0)||(indexPath.row == 1)||(indexPath.row == 2)||(indexPath.row == 3)||(indexPath.row == 4)  {
            
            cell.activeStatusView?.isHidden = false
            
            cell.inActiveStatusView?.isHidden = false
            
            cell.activeStatusView1?.isHidden = true
            
            cell.inActiveStatusView1?.isHidden = true
            
            cell.userImage?.isHidden = false
            
            cell.receivedBtn?.isHidden = true

        }else if indexPath.row == 5 {
            
            cell.receivedBtn?.isHidden = false
            
            cell.activeStatusView?.isHidden = true
            
            cell.inActiveStatusView?.isHidden = true
            
            cell.activeStatusView1?.isHidden = false
            
            cell.inActiveStatusView1?.isHidden = false
            
            cell.userImage?.isHidden = true

        }else if indexPath.row == ((self.orderStatusArray as NSArray).count - 1) {
            
            cell.activeStatusView?.isHidden = true
            
            cell.inActiveStatusView?.isHidden = true
            
            cell.activeStatusView1?.isHidden = false
            
            cell.inActiveStatusView1?.isHidden = true
            
            cell.userImage?.isHidden = true
            
            cell.receivedBtn?.isHidden = true
            
        }else {
            
            cell.activeStatusView?.isHidden = true
            
            cell.inActiveStatusView?.isHidden = true
            
            cell.activeStatusView1?.isHidden = false
            
            cell.inActiveStatusView1?.isHidden = false
            
            cell.userImage?.isHidden = true
            
            cell.receivedBtn?.isHidden = true
        }

        cell.trackOrderStatusLabel?.text = dict["title"] as? String
        
        cell.dateLabel?.text = dict["item"] as?  String
        
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        cell.separatorInset = UIEdgeInsets.zero
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: TDS.SCREEN_WIDTH , height: 42))
        let titleLabel = UILabel(frame: CGRect(x: 25, y: 19, width: 200 , height: 21))
        titleLabel.font = UIFont.avenirBlack(size: 20)!
        titleLabel.textColor = UIColor.charcoalGrey3
        titleLabel.text = "Order Status"
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

