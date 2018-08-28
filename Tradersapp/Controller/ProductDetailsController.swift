//
//  ProductDetailsController.swift
//  Tradersapp
//
//  Created by Ranjith Ravichandran on 13/08/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import UIKit

class ProductDetailsController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var Producttable: UITableView!

    var DetailArray = ["Product Code","Product Quality","Category","Product Sku","Size","Size Code","Grower","Note"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Producttable.register(UINib(nibName:"ProdcutDetailsCell", bundle: nil), forCellReuseIdentifier: "Cell")
        Producttable.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return DetailArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = Producttable.dequeueReusableCell(withIdentifier:"Cell", for: indexPath as IndexPath) as! ProdcutDetailsCell
        
        cell.selectionStyle = .none
       
        cell.Typelbl.text = DetailArray[indexPath.row]
        
        return cell
    }
    
    @IBAction func closeActn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
