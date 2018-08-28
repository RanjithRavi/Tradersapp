//
//  OrderViewController.swift
//  Tradersapp
//
//  Created by Ranjith Ravichandran on 12/06/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class OrderViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var itemtable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        itemtable.register(UINib(nibName:"OrderCell", bundle: nil), forCellReuseIdentifier: "Cell")
        SlideMenuOptions.contentViewScale = 1

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func leftmenuActn(_ sender: Any) {
        self.openLeft()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 140
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = itemtable.dequeueReusableCell(withIdentifier:"Cell", for: indexPath as IndexPath) as! OrderCell
       
        cell.innerview.layer.borderColor = UIColor(red:0.92, green:0.92, blue:0.95, alpha:1.0).cgColor
        cell.innerview.layer.borderWidth = 1.0

        cell.innerview.layer.shadowColor = UIColor(red:0.92, green:0.92, blue:0.95, alpha:1.0).cgColor
        cell.innerview.layer.shadowOffset = CGSize(width:0,height: 10.0)
        cell.innerview.layer.shadowRadius = 10.0
        cell.innerview.layer.shadowOpacity = 1.0
        cell.innerview.layer.masksToBounds = false
        cell.innerview.clipsToBounds = true
        cell.innerview.layer.cornerRadius = 8.0

        cell.shadowview.clipsToBounds = true
        cell.shadowview.layer.cornerRadius = 8.0
        
        cell.itemimage.clipsToBounds = true
        cell.itemimage.layer.cornerRadius = 8.0
        
        cell.trackbtn.clipsToBounds = true
        cell.trackbtn.layer.cornerRadius = 8.0
        
        cell.selectionStyle = .none
        
        cell.trackbtn.addTarget(self, action: #selector(pushtotrack), for: UIControlEvents.touchUpInside)
        
        return cell
    }
    
    @objc func pushtotrack() {
        
        let order = OrderStatusViewController()
        self.navigationController?.present(order, animated: true, completion: nil)
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let track = TrackScrollViewController()
        self.navigationController?.present(track, animated: true, completion: nil)
        
    }
}
