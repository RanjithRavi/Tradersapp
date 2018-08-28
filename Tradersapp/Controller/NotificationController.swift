//
//  NotificationController.swift
//  Tradersapp
//
//  Created by Ranjith Ravichandran on 13/08/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class NotificationController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var NotifySegment: UISegmentedControl!
    @IBOutlet weak var Notifytable: UITableView!
    
    var messageArray = ["1142ab31a","Hey Sorry to inform you that your order can't be fulfilled",""]

    let buttonBar = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        NotifySegment.backgroundColor = .clear
        NotifySegment.tintColor = .clear
        
        NotifySegment.setTitleTextAttributes([
            NSAttributedStringKey.font : UIFont.avenirMedium(size: 14)!,
            NSAttributedStringKey.foregroundColor: UIColor.lightGray
            ], for: .normal)
        
        NotifySegment.setTitleTextAttributes([
            NSAttributedStringKey.font : UIFont.avenirMedium(size: 14)!,
            NSAttributedStringKey.foregroundColor: UIColor.black
            ], for: .selected)
        
        buttonBar.translatesAutoresizingMaskIntoConstraints = false
        buttonBar.backgroundColor = UIColor.red
        view.addSubview(buttonBar)

        
        buttonBar.topAnchor.constraint(equalTo: NotifySegment.bottomAnchor).isActive = true
        buttonBar.heightAnchor.constraint(equalToConstant: 2).isActive = true
        buttonBar.leftAnchor.constraint(equalTo: NotifySegment.leftAnchor).isActive = true
        buttonBar.widthAnchor.constraint(equalTo: NotifySegment.widthAnchor, multiplier: 1 / CGFloat(NotifySegment.numberOfSegments)).isActive = true

        NotifySegment.addTarget(self, action: #selector(NotifysegmentValueChanged(_:)), for: UIControlEvents.valueChanged)

        Notifytable.estimatedRowHeight = 120

        Notifytable.register(UINib(nibName:"NotificationCell", bundle: nil), forCellReuseIdentifier: "Cell")
        Notifytable.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func leftmenuActn(_ sender: Any) {
        self.openLeft()
    }

    @objc func NotifysegmentValueChanged(_ sender: UISegmentedControl) {
        UIView.animate(withDuration: 0.3) {
            
            if self.NotifySegment.selectedSegmentIndex == 0
            {
               self.buttonBar.frame.origin.x = 20
            }
            else
            {
                self.buttonBar.frame.origin.x = ((self.NotifySegment.frame.width/2)+20)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = Notifytable.dequeueReusableCell(withIdentifier:"Cell", for: indexPath as IndexPath) as! NotificationCell
        
        cell.selectionStyle = .none
        
        cell.notifyProImg.layer.borderWidth=1.0
        cell.notifyProImg.layer.masksToBounds = false
        cell.notifyProImg.layer.borderColor = UIColor.white.cgColor
        cell.notifyProImg.layer.cornerRadius = cell.notifyProImg.frame.size.height/2
        cell.notifyProImg.clipsToBounds = true
        
        cell.messagetxt.text = messageArray[indexPath.row]
        
        return cell
    }
    
}
