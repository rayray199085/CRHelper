//
//  SCLocationsClanRankingsCell.swift
//  CRHelper
//
//  Created by Stephen Cao on 8/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

class SCLocationsClanRankingsCell: UITableViewCell {
    var clanRankingItem: SCLocationsClanRankingsItem?{
        didSet{
            clanNameLabel.text = clanRankingItem?.name
            rankLabel.text = "#\(clanRankingItem?.rank ?? 1)"
            memberCountLabel.text = "\(clanRankingItem?.members ?? 0)/50"
            locationLabel.text = clanRankingItem?.location?.name
            clanScoreLabel.text = "\(clanRankingItem?.clanScore ?? 0)"
        }
    }
    
    @IBOutlet weak var clanNameLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var memberCountLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var clanScoreLabel: UILabel!
}
