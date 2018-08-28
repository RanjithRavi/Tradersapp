//
//  SignupViewController.swift
//  Tradersapp
//
//  Created by Ranjith Ravichandran on 03/06/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import UIKit
import DropDown

class SignupViewController: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var mobileTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var signupbutton: UIButton!
    @IBOutlet weak var dropview: UIView!
    @IBOutlet weak var nameview: UIView!
    @IBOutlet weak var mobileview: UIView!
    @IBOutlet weak var emailview: UIView!
    @IBOutlet weak var passwordview: UIView!
    @IBOutlet weak var usertypeLbl: UILabel!
    @IBOutlet weak var usertypebtn: UIButton!
    
    let usertypedropdown = DropDown()
    
    lazy var typedropDown: [DropDown] = {
        return [
            self.usertypedropdown
        ]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.usertypeLbl.textColor = UIColor(red:0.72, green:0.72, blue:0.73, alpha:1.0)
        setupDropDown()
        typedropDown.forEach { $0.dismissMode = .onTap }
        typedropDown.forEach { $0.direction = .any }
        
        nameview.layer.cornerRadius = 29
        nameview.clipsToBounds = true
        
        mobileview.layer.cornerRadius = 29
        mobileview.clipsToBounds = true
        
        emailview.layer.cornerRadius = 29
        emailview.clipsToBounds = true
        
        passwordview.layer.cornerRadius = 29
        passwordview.clipsToBounds = true
        
        signupbutton.layer.cornerRadius = 29
        signupbutton.clipsToBounds = true
        
        dropview.layer.cornerRadius = 29
        dropview.clipsToBounds = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupDropDown() {
        usertypedropdown.anchorView = usertypeLbl
        usertypedropdown.width = self.dropview.frame.width-40
        // Will set a custom with instead of anchor view width
        //        dropDown.width = 100
        
        // By default, the dropdown will have its origin on the top left corner of its anchor view
        // So it will come over the anchor view and hide it completely
        // If you want to have the dropdown underneath your anchor view, you can do this:
        usertypedropdown.bottomOffset = CGPoint(x: 0, y: 35)
        
        // You can also use localizationKeysDataSource instead. Check the docs.
        usertypedropdown.dataSource = [
            "Buyer",
            "Seller"
        ]
        
        // Action triggered on selection
        usertypedropdown.selectionAction = { [unowned self] (index, item) in
            self.usertypeLbl.text = "\(item)"
            self.usertypeLbl.textColor = UIColor.black
            //self.selectedtype = "\(index+1)"
        }
    }
    
    @IBAction func TypeActn(_ sender: Any)
    {
        usertypedropdown.show()
    }
    
    @IBAction func backbutton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func registerApi ()  {
        
        var parmeters = [String:String]()
        parmeters = ["email":"tv@intrixtech.com","password":"tv123456"]
        
        var jsondata = NSData()

        do
        {
            jsondata = try JSONSerialization.data(withJSONObject: parmeters, options: .prettyPrinted) as NSData
        }
        catch
        {
            print(error.localizedDescription)
        }
        
    }
    
    @IBAction func signupAction(_ sender: Any) {
       
        if nameTF.text == ""{
            let alert = UIAlertController(title: "Error", message: "Please Enter your Name", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if mobileTF.text == ""{
            let alert = UIAlertController(title: "Error", message: "Please Enter your Mobile Number", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if phonevalidate(value: mobileTF.text!) == false{
            let alert = UIAlertController(title: "Error", message: "Please Check your Mobile Number", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if emailTF.text == ""{
            let alert = UIAlertController(title: "Error", message: "Please Enter your Email ID", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if isValidEmail(testStr: emailTF.text!) == false{
            let alert = UIAlertController(title: "Error", message: "Please Check your Email ID", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if passwordTF.text == ""{
            let alert = UIAlertController(title: "Error", message: "Please Enter your Password", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if usertypeLbl.text == "Select User Type"{
            let alert = UIAlertController(title: "Error", message: "Please Select User Type", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "TabBar") as! TTabBarViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
    }
    
    func phonevalidate(value: String) -> Bool {
        let PHONE_REGEX = "^((\\+)|(00))[0-9]{6,14}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: value)
        return result
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
}
