//
//  CollectionView.swift
//  Tradersapp
//
//  Created by Ranjith Ravichandran on 01/07/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
    
    class func cartListCollectionView(delegate : Any?) -> UICollectionView {
        
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = UICollectionViewScrollDirection.vertical
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        layout.itemSize = CGSize(width: TDS.SCREEN_WIDTH-40, height: 80)
        
        let collectionViewItem = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        collectionViewItem.setCollectionViewLayout(layout, animated: true)
        collectionViewItem.showsHorizontalScrollIndicator = false
        collectionViewItem.translatesAutoresizingMaskIntoConstraints = false
        collectionViewItem.backgroundColor = UIColor.clear
        collectionViewItem.delegate = delegate as? UICollectionViewDelegate
        collectionViewItem.dataSource = delegate as? UICollectionViewDataSource
        return collectionViewItem
    }
    
}

