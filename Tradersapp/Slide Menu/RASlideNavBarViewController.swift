//
//  RASlideNavBarViewController.swift
//  Tradersapp
//
//  Created by Apple on 16/08/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class RASlideNavBarViewController: SlideMenuController {

    override func isTagetViewController() -> Bool {
        if let vc = UIApplication.topViewController() {
            if vc is ViewController  {
                return true
            }
        }
        return false
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        return .default
    }

}
