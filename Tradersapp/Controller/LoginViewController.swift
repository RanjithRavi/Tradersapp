//
//  LoginViewController.swift
//  Tradersapp
//
//  Created by Ranjith Ravichandran on 03/06/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailfieldTF: UITextField!
    @IBOutlet weak var passwordfieldTF: UITextField!
    @IBOutlet weak var emailTFview: UIView!
    @IBOutlet weak var passwordTFview: UIView!
    @IBOutlet weak var loginbutton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        emailTFview.layer.cornerRadius = 29
        emailTFview.clipsToBounds = true
        
        passwordTFview.layer.cornerRadius = 29
        passwordTFview.clipsToBounds = true
        
        loginbutton.layer.cornerRadius = 29
        loginbutton.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backActn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func LoginAction(_ sender: Any) {
        
        if emailfieldTF.text == ""{
            
            let alert = UIAlertController(title: "Error", message: "Please Enter your Email ID", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if isValidEmail(testStr: emailfieldTF.text!) == false{
            
            let alert = UIAlertController(title: "Error", message: "Please Check your Email ID", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if passwordfieldTF.text == ""{
            
            let alert = UIAlertController(title: "Error", message: "Please Check your Password", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            
          /*  if currentReachabilityStatus != .notReachable
            {
                DispatchQueue.global(qos: .userInitiated).async {
                    //CustomLoaderView.addLoadIcon(self.view)
                    DispatchQueue.main.async {
                        self.loginrequest()
                    }
                }
            }
            else
            {
                let alert = UIAlertController(title: "Alert", message: "No Internet Connection.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Alert"), style: .default, handler: { _ in
                    NSLog("The \"OK\" alert occured.")
                }))
                self.present(alert, animated: true, completion: nil)
                
            }*/
            UIView.defaultAnimation({

                CustomLoaderView.addLoadIcon(self.view)

            }, duration: 0.25, completionWithAnimation: true, completion: {
                
                CustomLoaderView.removeLoadIcon(self.view)
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "OTPViewController") as! OTPViewController
                self.navigationController?.pushViewController(nextViewController, animated: true)
            })
            
//            DispatchQueue.main.async {
//
//            }
        }
    }
    
    func loginrequest(){
        
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
        
        let url = URL(string: "https://latertraderapp.herokuapp.com//api/v1/auth/sign_in")
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsondata as Data
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            guard error == nil else
            {
                print(error!)
                return
            }
            
            if response != nil
            {
                print(response!)
            }
            
            
            do
            {
                let jsondic = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                
                DispatchQueue.main.async {
                    CustomLoaderView.removeLoadIcon(self.view)
                    if (jsondic as? NSArray) != nil
                    {
                        print(jsondic)
                    }
                    else
                    {
                        print(jsondic)
                    }
                }
            }
            catch
            {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
 
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
}
