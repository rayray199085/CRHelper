//
//  SCCardsFlowLayout.swift
//  CRHelper
//
//  Created by Stephen Cao on 3/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

class SCCardsFlowLayout: UICollectionViewFlowLayout {
    override func prepare() {
        super.prepare()
        let cellsPerRow = 2
        let margin: CGFloat = 10
        minimumInteritemSpacing = margin
        minimumLineSpacing = margin
        sectionInset = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
        
        guard let collectionView = collectionView else { return }
        let marginsAndInsets = sectionInset.left + sectionInset.right + collectionView.safeAreaInsets.left + collectionView.safeAreaInsets.right + minimumInteritemSpacing * CGFloat(cellsPerRow - 1)
        let itemWidth = ((collectionView.bounds.size.width - marginsAndInsets) / CGFloat(cellsPerRow)).rounded(.down)
        itemSize =  CGSize(width: itemWidth, height: itemWidth)
    }
}
