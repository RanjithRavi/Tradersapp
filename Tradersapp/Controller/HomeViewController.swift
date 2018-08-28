//
//  HomeViewController.swift
//  Tradersapp
//
//  Created by Ranjith Ravichandran on 03/06/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class HomeViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collection: UICollectionView!
    
    var imageArray = ["abundance-apples-blur-349730.jpg", "charts-computer-data-669621.jpg", "almonds-berries-bowls-461359.jpg", "abundance-adults-box-696205.jpg"]
    var titleArray = ["Dashboard", "Market Place", "Purchase", "Purchase"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collection.dataSource = self
        self.collection.delegate = self
        
        self.collection.register(UINib(nibName: "DashboardCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        
        SlideMenuOptions.contentViewScale = 1

    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 4
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: 260.0, height: 400)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsetsMake(0, 30, 0, 30)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : DashboardCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath as IndexPath) as! DashboardCell
        
        cell.innerview.clipsToBounds = true
        cell.innerview.layer.cornerRadius = 4.0
                    
        cell.bgimage.clipsToBounds = true
        cell.bgimage.layer.cornerRadius = 4.0
        
        cell.bgimage.image = UIImage.init(named: imageArray[indexPath.item])
        cell.titlelbl.text = titleArray[indexPath.item]
            
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        print(indexPath.item)
        if indexPath.item == 0
        {
            
        }
        else if indexPath.item == 1
        {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MarketPlaceController") as! MarketPlaceController
            nextViewController.menubutton = false
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
    }
    
    @IBAction func leftmenuAction(_ sender: Any) {
        self.openLeft()
    }
}
