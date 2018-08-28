//
//  TrackScrollHeaderView.swift
//  Tradersapp
//
//  Created by Ranjith Ravichandran on 12/08/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import UIKit

class TrackScrollHeaderView: UITableViewHeaderFooterView {

    weak var titleLabel = UILabel()

    
    
    override init(reuseIdentifier: String?) {
        
        super.init(reuseIdentifier: reuseIdentifier)
        
        setUpViews()
        
    }
    
    
    func setUpViews() {

        let label = normalLabel(textfont: UIFont.avenirHeavy(size: 15)!, textColor: UIColor.black)
        label.text = "Add To Cart"
        label.textAlignment = NSTextAlignment.center
        self.contentView.addSubview(label)
        self.titleLabel = label
    }
    
    func setupConstraints() {

        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
