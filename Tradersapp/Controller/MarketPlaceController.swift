//
//  MarketPlaceController.swift
//  Tradersapp
//
//  Created by Ranjith Ravichandran on 24/06/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class MarketPlaceController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var menubtn: UIButton!
    @IBOutlet weak var offersSegment: UISegmentedControl!
    @IBOutlet weak var itemscollection: UICollectionView!
    @IBOutlet weak var sellerscollection: UICollectionView!
    @IBOutlet weak var searchview: UIView!
    @IBOutlet weak var offerscollection: UICollectionView!
    
    var appDelegate = AppDelegate()
    
    var menubutton : Bool!
    
    var sellertitlearr = ["Intl Pty Ltd.", "Jhon Cherries Pty", "New York", "Jhon Cherries Pty"]
    
    var itemtitlearr = ["Apple", "Coffee Beans", "Orange"]
    
    let buttonBar = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        offersSegment.backgroundColor = .clear
        offersSegment.tintColor = .clear
        
        offersSegment.setTitleTextAttributes([
            NSAttributedStringKey.font : UIFont.avenirMedium(size: 14)!,
            NSAttributedStringKey.foregroundColor: UIColor.lightGray
            ], for: .normal)
        
        offersSegment.setTitleTextAttributes([
            NSAttributedStringKey.font : UIFont.avenirMedium(size: 14)!,
            NSAttributedStringKey.foregroundColor: UIColor.black
            ], for: .selected)
        
        buttonBar.translatesAutoresizingMaskIntoConstraints = false
        buttonBar.backgroundColor = UIColor(red:0.00, green:0.34, blue:0.75, alpha:1.0)
        view.addSubview(buttonBar)
        
        buttonBar.topAnchor.constraint(equalTo: offersSegment.bottomAnchor).isActive = true
        buttonBar.heightAnchor.constraint(equalToConstant: 2).isActive = true
        buttonBar.leftAnchor.constraint(equalTo: offersSegment.leftAnchor).isActive = true
        buttonBar.widthAnchor.constraint(equalTo: offersSegment.widthAnchor, multiplier: 1 / CGFloat(offersSegment.numberOfSegments)).isActive = true
        
        offersSegment.addTarget(self, action: #selector(OfferssegmentValueChanged(_:)), for: UIControlEvents.valueChanged)
        
        searchview.layer.shadowColor = UIColor(red:0.95, green:0.95, blue:0.96, alpha:1.0).cgColor
        searchview.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        searchview.layer.shadowOpacity = 1.0
        searchview.layer.shadowRadius = 10.0
        
        searchview.layer.cornerRadius = 10.0
        searchview.layer.borderWidth = 1.0
        
        searchview.layer.borderColor = UIColor(red:0.89, green:0.89, blue:0.89, alpha:1.0).cgColor
        
        self.itemscollection.dataSource = self
        self.itemscollection.delegate = self
        
        self.sellerscollection.dataSource = self
        self.sellerscollection.delegate = self
        
        self.offerscollection.dataSource = self
        self.offerscollection.delegate = self
        
        self.itemscollection.register(UINib(nibName: "MarketplaceCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        self.sellerscollection.register(UINib(nibName: "MarketplaceCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        self.offerscollection.register(UINib(nibName: "OffersCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
    }

    override func viewWillAppear(_ animated: Bool)
    {
        self.navigationController?.isNavigationBarHidden = true
        
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        if menubutton == false{
            let image = UIImage(named: "blackback.png") as UIImage?
            menubtn.setImage(image, for: .normal)
        }
        else
        {
            let image = UIImage(named: "blackmenu.png") as UIImage?
            menubtn.setImage(image, for: .normal)
        }
    }
    
    @IBAction func popvc(_ sender: Any) {
        
        if menubutton == false{
            self.navigationController?.popViewController(animated: true)
        }
        else if menubutton == true{
            self.openLeft()
        }
    }
    
    @objc func OfferssegmentValueChanged(_ sender: UISegmentedControl) {
        UIView.animate(withDuration: 0.3) {
            
            if self.offersSegment.selectedSegmentIndex == 0
            {
                //self.buttonBar.frame.origin.x = 35
                self.buttonBar.frame.origin.x = ((self.offersSegment.frame.width / CGFloat(self.offersSegment.numberOfSegments)) * CGFloat(self.offersSegment.selectedSegmentIndex)+25)
            }
            else if self.offersSegment.selectedSegmentIndex == 1
            {
               // self.buttonBar.frame.origin.x = ((self.offersSegment.frame.width/3)+20)
                self.buttonBar.frame.origin.x = ((self.offersSegment.frame.width / CGFloat(self.offersSegment.numberOfSegments)) * CGFloat(self.offersSegment.selectedSegmentIndex)+20)
            }
            else
            {
                self.buttonBar.frame.origin.x = ((self.offersSegment.frame.width / CGFloat(self.offersSegment.numberOfSegments)) * CGFloat(self.offersSegment.selectedSegmentIndex)+20)

            }
        }
    }
    
    @IBAction func FilterPushActn(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "FilterController") as! FilterController
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }

    override func viewWillDisappear(_ animated: Bool)
    {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        if collectionView == self.sellerscollection
        {
            return sellertitlearr.count
        }
        else if collectionView == self.itemscollection
        {
            return itemtitlearr.count
        }
        else
        {
            return 5
        }
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        if collectionView == self.sellerscollection
        {
            return CGSize(width: 120.0, height: 165.0)
        }
        else if collectionView == self.itemscollection
        {
            return CGSize(width: 120.0, height: 165.0)
        }
        else
        {
            return CGSize(width: 325.0, height: 150.0)
        } 
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        if collectionView == self.sellerscollection
        {
            return UIEdgeInsetsMake(5, 5, 5, 10) // top, left, bottom, right
        }
        else if collectionView == self.itemscollection
        {
            return UIEdgeInsetsMake(5, 5, 5, 10) // top, left, bottom, right
        }
        else
        {
           return UIEdgeInsetsMake(8, 5, 8, 5) // top, left, bottom, right
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.sellerscollection
        {
            let cell : MarketplaceCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath as IndexPath) as! MarketplaceCell
            
            cell.bgimg.clipsToBounds = true
            cell.bgimg.layer.cornerRadius = 8
            cell.titleLbl.text = sellertitlearr[indexPath.item]
            
            return cell
        }
        else if collectionView == self.itemscollection
        {
            let cell : MarketplaceCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath as IndexPath) as! MarketplaceCell
            
            cell.bgimg.clipsToBounds = true
            cell.bgimg.layer.cornerRadius = 8
            cell.titleLbl.text = itemtitlearr[indexPath.item]
            
            return cell
        }
        else
        {
            let cell : OffersCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath as IndexPath) as! OffersCell
            
            cell.bgimg.clipsToBounds = true
            cell.bgimg.layer.cornerRadius = 8
            cell.addcartbtn.addTarget(self, action: #selector(cartaction), for: .touchUpInside)
            cell.addcartbtn.tag = indexPath.row
            cell.addbtn.isHidden = true
            cell.minusbtn.isHidden = true
            cell.addcartbtn.isHidden = false
            cell.valuelbl.isHidden = true
            cell.addbtn.tag = indexPath.row
            cell.addbtn.addTarget(self, action: #selector(cartaction), for: .touchUpInside)
            cell.minusbtn.tag = indexPath.row
            cell.minusbtn.addTarget(self, action: #selector(cartaction), for: .touchUpInside)

            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        if collectionView != self.sellerscollection && collectionView != self.itemscollection
        {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
          
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ProductDetailsController") as! ProductDetailsController
            //self.navigationController?.pushViewController(nextViewController, animated: true)
            self.present(nextViewController, animated: true, completion: nil)
        }
    }
    
    @objc func cartaction(sender: UIButton) {
        
        let int = sender.tag
        
        let indexPath = IndexPath(row: int, section: 0)
        
        let cell  = self.offerscollection.cellForItem(at: indexPath)as?OffersCell
        
        cell?.addcartbtn.isHidden = true
        
        cell?.addbtn.isHidden = false
        
        cell?.minusbtn.isHidden = false
        
        cell?.valuelbl.isHidden = false
        
        cell?.addbtn.tag = indexPath.row
        
        cell?.addbtn.addTarget(self, action: #selector(cartaction), for: .touchUpInside)
        
        cell?.minusbtn.tag = indexPath.row
        
        cell?.minusbtn.addTarget(self, action: #selector(cartaction), for: .touchUpInside)
        
    }
}
