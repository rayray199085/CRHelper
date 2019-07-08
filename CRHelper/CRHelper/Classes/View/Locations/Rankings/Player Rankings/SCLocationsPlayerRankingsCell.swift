
//
//  SCLocationsPlayerRankingsCell.swift
//  CRHelper
//
//  Created by Stephen Cao on 8/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

class SCLocationsPlayerRankingsCell: UITableViewCell {
    var item: SCLocationsPlayerRankingsItem?{
        didSet{
            nameLabel.text = item?.name
            trophyCountLabel.text = "\(item?.trophies ?? 0)"
            rankLabel.text = "#\(item?.rank ?? 1)"
            clanLabel.text = item?.clan?.name
            arenaLabel.text = item?.arena?.name
        }
    }
    
    @IBOutlet weak var trophyCountLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var clanLabel: UILabel!
    @IBOutlet weak var arenaLabel: UILabel!
    
}
