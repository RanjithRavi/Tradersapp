//
//  FilterController.swift
//  Tradersapp
//
//  Created by Ranjith Ravichandran on 24/06/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import UIKit
import RangeSeekSlider

class FilterController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,RangeSeekSliderDelegate {

    @IBOutlet fileprivate weak var CurrencySlider: RangeSeekSlider!
    
    @IBOutlet weak var categoryCollection: UICollectionView!
    @IBOutlet weak var offertypeCollection: UICollectionView!
    @IBOutlet weak var offerendCollection: UICollectionView!
    var appDelegate = AppDelegate()

    var categoryarr = ["Fruits", "Veg", "Others", "Man"]
    var offertypearr = ["Fixed", "Negotiable", "Negotiable with approval"]
    var offerendarr = ["Today", "Tomorrow", "In a weeek"]

    var categoryselectarr = [String]()
    var offertypeselectarr = [String]()
    var offerendselectarr = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.categoryCollection.dataSource = self
        self.categoryCollection.delegate = self
        
        self.offertypeCollection.dataSource = self
        self.offertypeCollection.delegate = self
        
        self.offerendCollection.dataSource = self
        self.offerendCollection.delegate = self
        
        self.setup()
        self.categoryCollection.register(UINib(nibName: "FilterCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        self.offertypeCollection.register(UINib(nibName: "FilterCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        self.offerendCollection.register(UINib(nibName: "FilterCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setup()
    {
        CurrencySlider.delegate = self 
        CurrencySlider.minValue = 0.0
        CurrencySlider.maxValue = 10000.0
        CurrencySlider.selectedMinValue = 50.0
        CurrencySlider.selectedMaxValue = 10000.0
        //CurrencySlider.minDistance = 20.0
       // CurrencySlider.maxDistance = 80.0
        //CurrencySlider.handleDiameter = 30.0
        CurrencySlider.tintColor = UIColor.lightGray
        CurrencySlider.selectedHandleDiameterMultiplier = 1.3
        CurrencySlider.numberFormatter.numberStyle = .currency
        CurrencySlider.numberFormatter.locale = Locale(identifier: "en_US")
        CurrencySlider.numberFormatter.maximumFractionDigits = 2
        CurrencySlider.minLabelFont = UIFont(name: "ChalkboardSE-Regular", size: 15.0)!
        CurrencySlider.maxLabelFont = UIFont(name: "ChalkboardSE-Regular", size: 15.0)!
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        self.navigationController?.isNavigationBarHidden = true
        
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        categoryselectarr.removeAll()
        offertypeselectarr.removeAll()
        offerendselectarr.removeAll()
        
        for catindex in 0..<categoryarr.count
        {
            categoryselectarr.append("0")
        }
        
        for offindex in 0..<offertypearr.count
        {
            offertypeselectarr.append("0")
        }
        
        for endindex in 0..<offerendarr.count
        {
            offerendselectarr.append("0")
        }
        
        self.categoryCollection.reloadData()
        self.offertypeCollection.reloadData()
        self.offerendCollection.reloadData()
    }
    
    @IBAction func popvc(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        self.navigationController?.isNavigationBarHidden = true
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        if collectionView == self.categoryCollection
        {
            return categoryarr.count
        }
        else if collectionView == self.offertypeCollection
        {
            return offertypearr.count
        }
        else
        {
            return offerendarr.count
        }
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        if collectionView == self.categoryCollection
        {
            return CGSize(width: 120.0, height: 40.0)
        }
        else if collectionView == self.offertypeCollection
        {
            return CGSize(width: 120.0, height: 40.0)
        }
        else
        {
            return CGSize(width: 120.0, height: 40.0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        if collectionView == self.categoryCollection
        {
            return UIEdgeInsetsMake(5, 5, 5, 10) // top, left, bottom, right
        }
        else if collectionView == self.offertypeCollection
        {
            return UIEdgeInsetsMake(5, 5, 5, 10) // top, left, bottom, right
        }
        else
        {
            return UIEdgeInsetsMake(8, 5, 8, 5) // top, left, bottom, right
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.categoryCollection
        {
            let cell : FilterCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath as IndexPath) as! FilterCell
            
            cell.bgview.clipsToBounds = true
            cell.bgview.layer.cornerRadius = 8
            cell.innerbg.clipsToBounds = true
            cell.innerbg.layer.cornerRadius = 4
            cell.titlelbl.text = categoryarr[indexPath.item]
            
            if categoryselectarr[indexPath.row] == "0"
            {
                cell.innerbg.backgroundColor = UIColor(red:0.95, green:0.96, blue:0.97, alpha:1.0)
                cell.bgview.backgroundColor = UIColor(red:0.95, green:0.96, blue:0.97, alpha:1.0)
            }
            else
            {
                cell.innerbg.backgroundColor = UIColor.white
                cell.bgview.backgroundColor = UIColor(red:1.00, green:0.00, blue:0.00, alpha:1.0)
            }
            
            return cell
        }
        else if collectionView == self.offertypeCollection
        {
            let cell : FilterCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath as IndexPath) as! FilterCell
            
            cell.bgview.clipsToBounds = true
            cell.bgview.layer.cornerRadius = 8
            cell.innerbg.clipsToBounds = true
            cell.innerbg.layer.cornerRadius = 4
            cell.titlelbl.text = offertypearr[indexPath.item]
            
            if offertypeselectarr[indexPath.row] == "0"
            {
                cell.innerbg.backgroundColor = UIColor(red:0.95, green:0.96, blue:0.97, alpha:1.0)
                cell.bgview.backgroundColor = UIColor(red:0.95, green:0.96, blue:0.97, alpha:1.0)
            }
            else
            {
                cell.innerbg.backgroundColor = UIColor.white
                cell.bgview.backgroundColor = UIColor(red:1.00, green:0.00, blue:0.00, alpha:1.0)
            }
            
            
            return cell
        }
        else
        {
            let cell : FilterCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath as IndexPath) as! FilterCell
            
            cell.bgview.clipsToBounds = true
            cell.bgview.layer.cornerRadius = 8
            cell.innerbg.clipsToBounds = true
            cell.innerbg.layer.cornerRadius = 4
            cell.titlelbl.text = offerendarr[indexPath.item]
            
            if offerendselectarr[indexPath.row] == "0"
            {
                cell.innerbg.backgroundColor = UIColor(red:0.95, green:0.96, blue:0.97, alpha:1.0)
                cell.bgview.backgroundColor = UIColor(red:0.95, green:0.96, blue:0.97, alpha:1.0)
            }
            else
            {
                cell.innerbg.backgroundColor = UIColor.white
                cell.bgview.backgroundColor = UIColor(red:1.00, green:0.00, blue:0.00, alpha:1.0)
            }
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        if collectionView == self.categoryCollection
        {
            categorysel(indexPath.row)
        }
        else if collectionView == self.offertypeCollection
        {
            offertypesel(indexPath.row)
        }
        else
        {
           endtypesel(indexPath.row)
        }
    }
    
    func categorysel(_ index: Int)
    {
        categoryselectarr.removeAll()
        for catindex in 0..<categoryarr.count
        {
            if catindex == index
            {
                categoryselectarr.append("1")
            }
            else
            {
                categoryselectarr.append("0")
            }
        }
        self.categoryCollection.reloadData()
    }
    
    func offertypesel(_ index: Int)
    {
        offertypeselectarr.removeAll()
        for offindex in 0..<offertypearr.count
        {
            if offindex == index
            {
               offertypeselectarr.append("1")
            }
            else
            {
                offertypeselectarr.append("0")
            }
        }
        self.offertypeCollection.reloadData()
    }
    
    func endtypesel(_ index: Int)
    {
        offerendselectarr.removeAll()
        for endindex in 0..<offerendarr.count
        {
            if endindex == index
            {
                offerendselectarr.append("1")
            }
            else
            {
                offerendselectarr.append("0")
            }
        }
        
        self.offerendCollection.reloadData()
    }
}

extension ViewController: RangeSeekSliderDelegate {
    
    func rangeSeekSlider(_ slider: RangeSeekSlider, didChange minValue: CGFloat, maxValue: CGFloat) {
        
            print("Currency slider updated. Min Value: \(minValue) Max Value: \(maxValue)")
    }
    
    func didStartTouches(in slider: RangeSeekSlider) {
        print("did start touches")
    }
    
    func didEndTouches(in slider: RangeSeekSlider) {
        print("did end touches")
    }
}
