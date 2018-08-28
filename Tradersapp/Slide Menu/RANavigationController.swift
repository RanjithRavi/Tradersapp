//
//  RANavigationController.swift
//  Tradersapp
//
//  Created by Apple on 16/08/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class RANavigationController: UINavigationController {

    class func navigationWithRootViewController (controller:UIViewController) -> RANavigationController  {
        
        let navigation  = RANavigationController.init(rootViewController: controller)

        return navigation
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

       self.setUpsubView()
    }
    
    func setUpsubView ()  {
        
        self.navigationBar.setBackgroundImage( UIImage(), for: .default)
        
        self.navigationBar.shadowImage = UIImage()
        
        self.view.backgroundColor = UIColor.clear
        
        self.navigationBar.barTintColor = UIColor.red
        
        self.navigationBar.tintColor = UIColor.black
        
        self.navigationBar.isTranslucent = true
        self.navigationBar.isHidden = true
        
        self.updateBackIndicatorImage(UIImage(named: "back.png")!)
        
    }
    
    @objc func updateDefaultBackIndicatorImage() {
        
        self.updateBackIndicatorImage(UIImage(named: "back.png")!)
    }

    @objc func updateBackIndicatorImage(_ image : UIImage) {
        
        self.navigationBar.backIndicatorImage = image
        
        self.navigationBar.backIndicatorTransitionMaskImage = image
        
    }
    
    func addLeftNavigationBackItem(title : String, foregroundColor: UIColor, font: UIFont, target: AnyObject, selector: Selector?) {
        
        self.updateBackIndicatorImage(UIImage.init())
        
        let leftBtn = UIBarButtonItem (title: title, style: .plain, target: target, action: selector)
        
        let aattrs = [
            NSAttributedStringKey.foregroundColor: foregroundColor,
            NSAttributedStringKey.font: font
        ]
        
        leftBtn.setTitleTextAttributes(aattrs, for: .normal)
        
        self.navigationItem.backBarButtonItem = leftBtn
    }
    
    @objc func updateNavigationColor(_ color : UIColor) {
        
        self.view.backgroundColor = color
        
        self.navigationBar.backgroundColor = color
        
    }
    
    override var childViewControllerForStatusBarStyle : UIViewController? {
        
        return self.topViewController
    }
    
    override var childViewControllerForStatusBarHidden : UIViewController? {
        
        return self.topViewController
    }
    
}
