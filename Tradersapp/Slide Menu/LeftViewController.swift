//
//  LeftViewController.swift
//  SlidemenuSample
//
//  Created by Apple on 16/08/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class LeftViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var table: UITableView!
    
    let swiftBlogs = ["My Profile", "Orders", "Offers", "Notifications", "Help & Support", "Logout"]
    let imagearray = ["user.png", "dollarsymbol.png", "leaf.png", "notificationbell.png", "information.png", "logout.png"]
    
    var headerview :UIView!
    var headerimage :UIImageView!
    var headerlabel :UILabel!
    var titlelabel :UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        table.delegate = self
        table.dataSource = self
        table.reloadData()
        
        table.register(UINib.init(nibName: "LeftMenuCell", bundle: nil), forCellReuseIdentifier: "Cell")
        table.register(UINib.init(nibName: "LeftMenuHeaderCell", bundle: nil), forHeaderFooterViewReuseIdentifier: "LeftMenuHeaderCell")
        table.register(UINib.init(nibName: "LeftMenuFooterCell", bundle: nil), forHeaderFooterViewReuseIdentifier: "LeftMenuFooterCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return swiftBlogs.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        if (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone)
        {
            return 200
        }
        else
        {
            return 160
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        // remove bottom extra 20px space.
        return 120
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 60
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "LeftMenuHeaderCell") as! LeftMenuHeaderCell
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "LeftMenuFooterCell") as! LeftMenuFooterCell
        return footerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! LeftMenuCell
        
        cell.leftmenutitlelbl.text = swiftBlogs[indexPath.row]
        cell.leftmenuimg.image = UIImage.init(named: imagearray[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        switch indexPath.row {
        case 0:
            let profile = self.storyboard?.instantiateViewController(withIdentifier: "TabBar") as! TTabBarViewController
            profile.selectedIndex = 4
            let profileVC = RANavigationController(rootViewController: profile)
            profileVC.navigationBar.isTranslucent = true
            self.slideMenuController()?.changeMainViewController(profileVC, close: true)
            break
        case 1:
            let mainViewController = self.storyboard?.instantiateViewController(withIdentifier: "TabBar") as! TTabBarViewController
            mainViewController.selectedIndex = 1
            let navorderVC = RANavigationController(rootViewController: mainViewController)
            navorderVC.navigationBar.isTranslucent = true
            self.slideMenuController()?.changeMainViewController(navorderVC, close: true)
            break
        case 2:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let mainViewController = storyboard.instantiateViewController(withIdentifier: "MarketPlaceController") as! MarketPlaceController
            mainViewController.menubutton = true
            let navHomeVC = RANavigationController(rootViewController: mainViewController)
            navHomeVC.navigationBar.isTranslucent = true
            self.slideMenuController()?.changeMainViewController(navHomeVC, close: true)
            
            break
        case 3:
            let mainViewController = self.storyboard?.instantiateViewController(withIdentifier: "TabBar") as! TTabBarViewController
            mainViewController.selectedIndex = 3
            let navHomeVC = RANavigationController(rootViewController: mainViewController)
            navHomeVC.navigationBar.isTranslucent = true
            self.slideMenuController()?.changeMainViewController(navHomeVC, close: true)
            
            break
        case 4:
            /* let storyboard = UIStoryboard(name: "Main", bundle: nil)
             let mainViewController = storyboard.instantiateViewController(withIdentifier: "LogoutViewController") as! LogoutViewController
             let navHomeVC = RANavigationController(rootViewController: mainViewController)
             navHomeVC.navigationBar.isTranslucent = true
             self.slideMenuController()?.changeMainViewController(navHomeVC, close: true) */
            
           /* let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let mainViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            let navHomeVC = RANavigationController(rootViewController: mainViewController)
            navHomeVC.navigationBar.isTranslucent = true
            self.slideMenuController()?.changeMainViewController(navHomeVC, close: true)*/
            
            break
        case 5:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let mainViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            let navHomeVC = RANavigationController(rootViewController: mainViewController)
            navHomeVC.navigationBar.isTranslucent = true
            self.slideMenuController()?.changeMainViewController(navHomeVC, close: true)
            break
        default:
            break
        }
    }
    
    func uicolorFromHex(rgbValue:UInt32)->UIColor
    {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:1.0)
    }
    
}
