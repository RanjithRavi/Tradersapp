//
//  ScrollView.swift
//  Tradersapp
//
//  Created by Ranjith Ravichandran on 01/07/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import Foundation
import UIKit

extension UIScrollView {
    
    class func bgScrollView(backgroundColor: UIColor, delegate : Any?) -> UIScrollView {
        
        let scrollView = UIScrollView()
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.backgroundColor = backgroundColor
        
        scrollView.showsHorizontalScrollIndicator = false
        
        scrollView.showsVerticalScrollIndicator = false
        
        scrollView.bounces = true
        
        scrollView.clipsToBounds = true
        
        scrollView.delegate = delegate as? UIScrollViewDelegate
        
        return scrollView
    }
}
