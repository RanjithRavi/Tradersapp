//
//  ViewController.swift
//  Tradersapp
//
//  Created by Ranjith Ravichandran on 03/06/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginbtn: UIButton!
    @IBOutlet weak var signupbtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginbtn.layer.cornerRadius = 8
        loginbtn.clipsToBounds = true
        
        signupbtn.layer.cornerRadius = 8
        signupbtn.clipsToBounds = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func signupAction(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @IBAction func loginAction(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(nextViewController, animated: true)
        
        
        /*(let profileView  = ProfileViewController()
        
        self.navigationController?.pushViewController(profileView, animated: true)*/
        
      /*  let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ProductDetailsController") as! ProductDetailsController
        self.navigationController?.pushViewController(nextViewController, animated: true) */
    }
}

