//
//  ProfileViewController.swift
//  Tradersapp
//
//  Created by Ranjith Ravichandran on 18/06/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import UIKit

let kProfileUserCellIdentifier = "kProfileUserCellIdentifier"

let kCardCellIdentifier = "kCardCellIdentifier"

class ProfileViewController: UIViewController {
    
    weak var bannerView : ProfileTopView!
    
    weak var scrollView: UIScrollView!

    weak var userTable : UITableView!
    
    weak var tableViewHeight: NSLayoutConstraint!
    
    weak var cardTableView: UITableView!

    var aboutTitlearray: NSArray!
    
    var cardsArray: NSArray!
    
    weak var sideMenuBtn = UIButton()

    weak var titleLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        self.aboutTitlearray = [[["title":"Name","value":"Viswanathan TV"]],
                                [["title":"City","value":"Bangalore, India"]],
                                [["title":"E-mail","value":"robbyarya7497@gmail.com"]],
                                [["title":"Mobile","value":"8838253152"]]]
        
        self.cardsArray = ["Credit Card  "]
        
        self.setUpSubView()

    }
    
    func profileAPI() {
        
        
    }

    @objc func leftmenuActn(_ sender: Any) {
        
        self.openLeft()
    }
    
    // MARK : - setUpView
    
    func setUpSubView ()  {
        
        let editView = ProfileTopView ()
        editView.translatesAutoresizingMaskIntoConstraints = false
        editView.layer.cornerRadius = 50.0
        editView.isUserInteractionEnabled = true
        self.view .addSubview(editView)
        self.bannerView = editView
        
        let btn  = UIButton.TDSNormalButton()
        let image = UIImage(named: "menu.png")
        btn.setImage(image?.withRenderingMode(.alwaysOriginal), for: .normal)
        btn.addTarget(self, action: #selector(leftmenuActn), for: .touchUpInside)
        btn.isUserInteractionEnabled = true
        self.bannerView.addSubview(btn)
        self.sideMenuBtn = btn
        
        let label = normalLabel(textfont: UIFont.avenirHeavy(size: 16)!, textColor: UIColor.black)
        label.text = "Profile"
        label.textColor = UIColor.white
        label.textAlignment = NSTextAlignment.center
        self.bannerView.addSubview(label)
        self.titleLabel = label
        
        let scrollViewItem = UIScrollView()
        if #available(iOS 11.0, *) {
            scrollViewItem.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
        scrollViewItem.translatesAutoresizingMaskIntoConstraints = false
        scrollViewItem.showsVerticalScrollIndicator = false
        scrollViewItem.alwaysBounceVertical = true
        scrollViewItem.backgroundColor = UIColor.white
        scrollViewItem.contentInset = UIEdgeInsetsMake(0, 0, 500, 0)
        self.scrollView = scrollViewItem
        self.view.addSubview(scrollViewItem)
        
        let table = profileListTableView()
        table.delegate = self
        table.dataSource = self
        table.register(ProfileUserTableViewCell.self, forCellReuseIdentifier: kProfileUserCellIdentifier)
        self.scrollView .addSubview(table)
        self.userTable = table
        
        let cardTableViewItem = profileListTableView()
        cardTableViewItem.delegate = self
        cardTableViewItem.dataSource = self
        cardTableViewItem.register(ProfileCardsTableViewCell.self, forCellReuseIdentifier: kCardCellIdentifier)
        self.cardTableView = cardTableViewItem
        self.scrollView.addSubview(cardTableView)

        self .setUpConstraint()
    }
    
    // MARK : - setUpConstraint
    
    func setUpConstraint ()  {
        
        //self.bannerImage
        self.bannerView.leadingAnchor .constraint(equalTo: (self.bannerView.superview?.leadingAnchor)!).isActive = true
        self.bannerView.trailingAnchor .constraint(equalTo: (self.bannerView.superview?.trailingAnchor)!).isActive = true
        self.bannerView.topAnchor .constraint(equalTo: (self.bannerView.superview?.topAnchor)!).isActive = true
        self.bannerView.bottomAnchor .constraint(equalTo: (self.scrollView.topAnchor), constant: -40).isActive = true
        
        self.sideMenuBtn?.anchorConstraint(top: self.bannerView.topAnchor, leading: self.bannerView.leadingAnchor, bottom: nil, trailing: nil,padding: .init(top: 32, left: 20, bottom: 0, right: 0),size: .init(width: 20, height: 20))
       
        self.titleLabel?.anchorConstraint(top: self.bannerView.topAnchor, leading: self.bannerView.leadingAnchor, bottom: nil, trailing: self.bannerView.trailingAnchor,padding: .init(top: 35, left: 0, bottom: 0, right: 0))
        
        //self.scrollView
        self.scrollView?.leadingAnchor.constraint(equalTo: (self.scrollView?.superview?.leadingAnchor)!, constant: 0).isActive = true
        self.scrollView?.widthAnchor.constraint(equalTo: (self.scrollView?.superview?.widthAnchor)!, constant: 0).isActive = true
        self.scrollView?.trailingAnchor.constraint(equalTo: (self.scrollView?.superview?.trailingAnchor)!, constant: 0).isActive = true
        self.scrollView?.bottomAnchor.constraint(equalTo: (self.scrollView?.superview?.bottomAnchor)!, constant: 0).isActive = true
        
        //self.userTable
        self.userTable.topAnchor .constraint(equalTo: (self.userTable.superview?.topAnchor)!).isActive = true
        self.userTable.leadingAnchor .constraint(equalTo: (self.userTable.superview?.leadingAnchor)!).isActive = true
        self.userTable.trailingAnchor .constraint(equalTo: (self.userTable.superview?.trailingAnchor)!).isActive = true
        self.userTable.heightAnchor .constraint(equalToConstant: 300).isActive = true
        self.userTable?.widthAnchor.constraint(equalTo: (self.userTable?.superview?.widthAnchor)!, constant: 0).isActive = true

        self.cardTableView.topAnchor .constraint(equalTo: (self.userTable.bottomAnchor)).isActive = true
        self.cardTableView.leadingAnchor .constraint(equalTo: (self.cardTableView.superview?.leadingAnchor)!).isActive = true
        self.cardTableView.trailingAnchor .constraint(equalTo: (self.cardTableView.superview?.trailingAnchor)!).isActive = true
        self.cardTableView.heightAnchor .constraint(equalToConstant: 300).isActive = true
        self.cardTableView?.widthAnchor.constraint(equalTo: (self.cardTableView?.superview?.widthAnchor)!, constant: 0).isActive = true
    }

}

//MARK:- UITableview Delegate & DataSource

extension ProfileViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {

        if tableView == self.userTable {
            
            return 4
        } else {
            
            return 1
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if tableView == userTable {
            
            return 60
        }else {
            
            return 30
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if tableView == userTable {
            
            let headerViewItem = UIView(frame: CGRect(x: 0, y: 0, width: TDS.SCREEN_WIDTH, height: 5))
            return headerViewItem
            
        } else {
            
            let view = UIView(frame: CGRect(x: 0, y: 0, width: TDS.SCREEN_WIDTH , height: 30))
            let titleLabel = UILabel(frame: CGRect(x: 20, y: 0, width: 200 , height: 21))
            titleLabel.font = UIFont.avenirLight(size: 12)
            titleLabel.textColor = UIColor.charcoalGreyThree
            titleLabel.text = "Payment Mode"
            view.addSubview(titleLabel)
            return view
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

        if tableView == userTable {
            
            return 5
        } else {
            
            return 30
        }

    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
          if tableView == userTable {
            
        let footerViewItem = UIView(frame: CGRect(x: 0, y: 0, width: TDS.SCREEN_WIDTH, height: 5))
        return footerViewItem
          } else {
            
            let view = UIView(frame: CGRect(x: 0, y: 0, width: TDS.SCREEN_WIDTH , height: 100))
            let titleLabel = UILabel()
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.font = UIFont.avenirBlack(size: 12)
            titleLabel.textColor = UIColor.charcoalGrey
            titleLabel.text = "Notifications"
            view.addSubview(titleLabel)
            
            let cguSwitch = UISwitch()
            cguSwitch.translatesAutoresizingMaskIntoConstraints = false
            cguSwitch.onTintColor = UIColor.red
            view.addSubview(cguSwitch)
            
            titleLabel.topAnchor.constraint(equalTo: (titleLabel.superview?.topAnchor)!, constant: 0).isActive = true
            titleLabel.leadingAnchor.constraint(equalTo: (titleLabel.superview?.leadingAnchor)!, constant: 20).isActive = true
            titleLabel.bottomAnchor.constraint(equalTo: (titleLabel.superview?.bottomAnchor)!, constant: -15).isActive = true
            
            cguSwitch.topAnchor.constraint(equalTo: (cguSwitch.superview?.topAnchor)!, constant: 30).isActive = true
            cguSwitch.trailingAnchor.constraint(equalTo: (cguSwitch.superview?.trailingAnchor)!, constant: -20).isActive = true
            cguSwitch.bottomAnchor.constraint(equalTo: (cguSwitch.superview?.bottomAnchor)!, constant: -9).isActive = true
            cguSwitch.heightAnchor.constraint(equalToConstant: 40).isActive = true

            
            return view
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        if tableView == userTable {
            
            return 5
        } else {
            
            return 100
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(tableView == self.userTable) {
            
            let array = self.aboutTitlearray[section] as! NSArray
            
            return array.count
            
        } else if(tableView == self.cardTableView){
            
            return self.cardsArray.count
            
        } else {
            
            return 0
        }
        
    }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            if tableView == userTable {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: kProfileUserCellIdentifier, for: indexPath) as! ProfileUserTableViewCell
                
                let arrayItem = self.aboutTitlearray[indexPath.section] as! NSArray
                
                let dict = arrayItem[indexPath.row] as! NSDictionary
                
                cell.userTitleLabel.text = dict["title"] as? String
                
                cell.userDetailLabel.text = dict["value"] as? String
                
                return cell
            } else {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: kCardCellIdentifier, for: indexPath) as! ProfileCardsTableViewCell
                cell.userTitleLabel.text = self.cardsArray[indexPath.row] as? String
                
                return cell
            }
        }
        
        func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
            
            if tableView == userTable {
                
                  return 40
            } else {
                
                return 20
            }
                
        }
}

