//
//  SCCardsCollectionViewCell.swift
//  SCCarHelper
//
//  Created by Stephen Cao on 27/6/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

class SCCardsCollectionViewCell: UICollectionViewCell {
    var cardDataItem: SCCardsDataItem?{
        didSet{
            cardImageView.image = cardDataItem?.iconUrls?.cardImage
        }
    }
    @IBOutlet weak var cardImageView: UIImageView!
}
