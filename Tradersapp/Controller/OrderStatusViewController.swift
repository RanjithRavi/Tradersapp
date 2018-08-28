//
//  OrderStatusViewController.swift
//  Tradersapp
//
//  Created by Ranjith Ravichandran on 17/08/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import UIKit

class OrderStatusViewController: UIViewController {

    var orderStatusArray = [["title":"Order Placed","item":"24th July 2018, 7.00 pm"],
                            ["title":"Order Approved","item":"24th July 2018, 7.00 pm"],
                            ["title":"Paid/ Credit Approved","item":"24th July 2018, 7.00 pm"],
                            ["title":"Packed","item":"24th July 2018, 7.00 pm"],
                            ["title":"Dropped Off","item":"24th July 2018, 7.00 pm"],
                            ["title":"Order Received"],
                            ["title":"Credit Payment Done"],
                            ["title":"Closed"]]
    
    weak var trackScrollTable  = UITableView()
    
    weak var sideMenuBtn = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        setUpSubView ()

        // Do any additional setup after loading the view.
    }

    @objc func dismissButtonAction() {
        
        dismiss(animated: true, completion: nil)
    }

    func setUpSubView ()  {
        
        let btn  = UIButton.TDSNormalButton()
        let image = UIImage(named: "x-button.png")
        btn.setImage(image?.withRenderingMode(.alwaysOriginal), for: .normal)
        btn.addTarget(self, action: #selector(dismissButtonAction), for: .touchUpInside)
        self.view.addSubview(btn)
        self.sideMenuBtn = btn
        
        let table = createBasicPlainTableView()
        table.delegate = self
        table.dataSource = self
        table.isScrollEnabled = true
        table.register(OrderStatusTableViewCell.self, forCellReuseIdentifier: KOrderStatusCellID)
        table.separatorStyle = UITableViewCellSeparatorStyle.none
        table.backgroundColor = UIColor.white;
        table.contentInset = UIEdgeInsetsMake(0, 0, 50, 0)
        self.view?.addSubview(table)
        self.trackScrollTable = table
        
        
        setUpConstraint ()
    }
    
    func setUpConstraint ()  {
        
        self.sideMenuBtn?.anchorConstraint(top: self.view.topAnchor, leading: self.view.leadingAnchor, bottom: nil, trailing: nil,padding: .init(top: 32, left: 20, bottom: 0, right: 0),size: .init(width: 40, height: 40))
        
        self.trackScrollTable?.leadingAnchor .constraint(equalTo: ((self.trackScrollTable?.superview?.leadingAnchor))!,constant:0).isActive = true
        self.trackScrollTable?.trailingAnchor .constraint(equalTo: (self.trackScrollTable?.superview?.trailingAnchor)!,constant:0).isActive = true
        self.trackScrollTable?.topAnchor .constraint(equalTo: (self.sideMenuBtn?.bottomAnchor)!,constant:20).isActive = true
        self.trackScrollTable?.bottomAnchor .constraint(equalTo: (self.trackScrollTable?.superview?.bottomAnchor)!,constant:0).isActive = true

    }
    
}


//MARK:- UITableView Delegate & DataSource

extension OrderStatusViewController : UITableViewDelegate, UITableViewDataSource {
    
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
        view.backgroundColor = UIColor.white
        let titleLabel = UILabel(frame: CGRect(x: 25, y: 19, width: 200 , height: 21))
        titleLabel.font = UIFont.avenirBlack(size: 20)!
        titleLabel.textColor = UIColor.charcoalGrey3
        titleLabel.text = "Order Status"
        titleLabel.backgroundColor = UIColor.white
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
