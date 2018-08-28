//
//  TableView.swift
//  Tradersapp
//
//  Created by Ranjith Ravichandran on 19/06/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import Foundation

import UIKit

extension UITableView {
    
    func setupTableView() {
        
        self.isScrollEnabled = true
        self.showsVerticalScrollIndicator = false
        self.alwaysBounceVertical = true
        self.allowsSelection = false
        self.separatorStyle = .none
        
    }
}

func createBasicTableView() -> UITableView {
    
    let tableViewItem = UITableView()
    tableViewItem.translatesAutoresizingMaskIntoConstraints = false
    return tableViewItem
    
}

func createBasicPlainTableView() -> UITableView {
    
    let tableViewItem = UITableView.init(frame: CGRect.zero, style: .plain)
    tableViewItem.translatesAutoresizingMaskIntoConstraints = false
    return tableViewItem
    
}
func createBasicGroupTableView() -> UITableView {
    
    let tableViewItem = UITableView.init(frame: CGRect.zero, style: .grouped)
    tableViewItem.translatesAutoresizingMaskIntoConstraints = false
    return tableViewItem
    
}


extension ProfileViewController {
    
    func profileListTableView() -> UITableView {
        
        let tableViewItem = createBasicGroupTableView()
        tableViewItem.setupTableView()
        tableViewItem.backgroundColor = UIColor.white
        return tableViewItem
        
    }
}
