//
//  SCPlayerChestCell.swift
//  CRHelper
//
//  Created by Stephen Cao on 5/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

class SCPlayerChestCell: UITableViewCell {

    var chest: SCPlayerChest?{
        didSet{
            guard let name = chest?.name else{
                return
            }
            chestImageView.image = UIImage(named: name)
            nameLabel.text = name
            countLabel.text = "+\(chest?.index ?? 0)"
        }
    }
    @IBOutlet weak var chestImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
}
