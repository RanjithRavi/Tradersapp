//
//  OTPViewController.swift
//  Tradersapp
//
//  Created by Ranjith Ravichandran on 15/08/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import UIKit
import LocalAuthentication

class OTPViewController: UIViewController ,UITextFieldDelegate {
    
    @IBOutlet weak var FingerView: UIView!
    @IBOutlet weak var fingerimg: UIImageView!
    @IBOutlet weak var otp1TF: UITextField!
    @IBOutlet weak var otp2TF: UITextField!
    @IBOutlet weak var otp3TF: UITextField!
    @IBOutlet weak var otp4TF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.OTPVerification()
        fingerprint()
        
        otp1TF.underlined()
        otp2TF.underlined()
        otp3TF.underlined()
        otp4TF.underlined()
        
        otp1TF.delegate = self
        otp2TF.delegate = self
        otp3TF.delegate = self
        otp4TF.delegate = self
        
        FingerView.layer.cornerRadius = FingerView.frame.size.height/2
        
        FingerView.layer.shadowColor = UIColor(red:0.92, green:0.92, blue:0.94, alpha:1.0).cgColor
        //FingerView.layer.shadowOffset = CGSize(width: 3.0, height: 2.0)
        //FingerView.layer.shadowOpacity = 1.0
        //FingerView.layer.shadowRadius = 10.0
        
        FingerView.clipsToBounds = false
        FingerView.layer.shadowColor = UIColor(red:0.92, green:0.92, blue:0.94, alpha:1.0).cgColor
        FingerView.layer.shadowOpacity = 1.0
        FingerView.layer.shadowOffset = CGSize.zero
        FingerView.layer.shadowRadius = 20
        
    }
    
    func fingerprint(){
        let context = LAContext()
        var error: NSError?
        
        guard context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) else {
            print("Touchid was error")
            return
        }
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: "Check Device Owner", reply: { (success, error) in
                if success {
                    DispatchQueue.main.async {
                        self.pushviewcontroller()
                    }
                }else {
                    DispatchQueue.main.async {
                        self.alertview(alertstring: "Authentication was error")
                    }
                }
            })
        }else {
            print(error?.localizedDescription as Any)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        /*let maxLength = 1          // set your need
         let currentString: NSString = textField.text! as NSString
         let newString: NSString =
         currentString.replacingCharacters(in: range, with: string) as NSString
         
         return newString.length <= maxLength
         //return newString.length <= maxLength */
        let currentString: NSString = textField.text! as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        let numberOnly = NSCharacterSet.init(charactersIn: "0123456789").inverted
        let strValid = string.rangeOfCharacter(from: numberOnly) == nil
        return (strValid && (newString.length <= 1))
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        if otp1TF.text != "" && otp2TF.text != "" && otp3TF.text != "" && otp4TF.text != ""{
            self.validateotp()
        }
        /*if textField == otp4TF
        {
            self.validateotp()
        }*/
    }
    
    func validateotp(){
        if otp1TF.text != "" && otp2TF.text != "" && otp3TF.text != "" && otp4TF.text != ""{
            if currentReachabilityStatus != .notReachable{
                CustomLoaderView.addLoadIcon(self.view)
                //self.OTPVerification()
            }
            else{
                self.alertview(alertstring: "No Internet Connection")
            }
        }
        else{
            self.alertview(alertstring: "Please Check your OTP")
        }
    }
    
    func OTPVerification(){
        var parmeters = [String:String]()
        parmeters = ["id":userid!,"utype":usertype!,"val_token":"6117648"]
        
        var jsondata = NSData()
        do{
            jsondata = try JSONSerialization.data(withJSONObject: parmeters, options: .prettyPrinted) as NSData
        }
        catch{
            print(error.localizedDescription)
        }
        
        let url = URL(string: "https://latertraderapp.herokuapp.com/api/v1/verifications")
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsondata as Data
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            guard error == nil else{
                print(error!)
                return
            }
            if response != nil{
                print(response!)
            }
            do{
                let jsondic = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                
                DispatchQueue.main.async {
                    CustomLoaderView.removeLoadIcon(self.view)
                    if (jsondic as? NSArray) != nil{
                        print(jsondic)
                    }
                    else{
                        let dict = jsondic as! NSDictionary
                        if dict["error"] != nil {
                            print(dict["error"] as! String)
                            self.alertview(alertstring: dict["error"] as! String)
                        }
                        else {
                            print((dict.value(forKey: "data") as! NSDictionary).value(forKey: "utype") as! String)
                            print((dict.value(forKey: "data") as! NSDictionary).value(forKey: "email") as! String)
                            print((dict.value(forKey: "data") as! NSDictionary).value(forKey: "id") as! NSNumber)
                            print((dict.value(forKey: "data") as! NSDictionary).value(forKey: "uid") as! String)
                            userid = "\((dict.value(forKey: "data") as! NSDictionary).value(forKey: "id") as! NSNumber)"
                            useruid = (dict.value(forKey: "data") as! NSDictionary).value(forKey: "uid") as! String
                            usertype = (dict.value(forKey: "data") as! NSDictionary).value(forKey: "utype") as! String
                            useremail = (dict.value(forKey: "data") as! NSDictionary).value(forKey: "email") as! String
                            let userdefault = UserDefaults.standard
                            userdefault.set(useruid, forKey: "uid")
                            userdefault.set(userid, forKey: "id")
                            userdefault.set(usertype, forKey: "utype")
                            userdefault.set(useremail, forKey: "email")
                            self.pushviewcontroller()
                        }
                    }
                }
            }
            catch{
                print(error.localizedDescription)
                self.alertview(alertstring: "Please Check Your Internet Connection")
            }
        }
        task.resume()
    }
    
    func alertview(alertstring: String!){
        let alert = UIAlertController(title: "Error", message: alertstring, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func pushviewcontroller(){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "TabBar") as! TTabBarViewController
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
}

extension UITextField {
    
    func underlined(){
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.lightGray.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }

}
