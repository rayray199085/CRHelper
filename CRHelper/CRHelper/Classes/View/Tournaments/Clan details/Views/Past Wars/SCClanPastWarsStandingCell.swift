//
//  SCClanPastWarsStandingCell.swift
//  CRHelper
//
//  Created by Stephen Cao on 7/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

class SCClanPastWarsStandingCell: UITableViewCell {
    var standing: SCClanPastWarsStanding?{
        didSet{
            clanNameLabel.text = standing?.clan?.name
            battleLabel.text = "\(standing?.clan?.battlesPlayed ?? 0)"
            winsLabel.text = "\(standing?.clan?.wins ?? 0)"
            crownLabel.text = "\(standing?.clan?.crowns ?? 0)"
            participantsLabel.text = "\(standing?.clan?.participants ?? 0)"
            trophiesLabel.text = "\(standing?.clan?.clanScore ?? 0)"
            changeLabel.text = "\(standing?.trophyChange ?? 0)"
            changeLabel.textColor = (standing?.trophyChange ?? 0) > 0 ? UIColor.green : UIColor.red
            rankLabel.text = "#\(standing?.clan?.rank ?? 1)"
        }
    }
    @IBOutlet weak var clanNameLabel: UILabel!
    
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var battleLabel: UILabel!
    @IBOutlet weak var winsLabel: UILabel!
    @IBOutlet weak var crownLabel: UILabel!
    @IBOutlet weak var participantsLabel: UILabel!
    @IBOutlet weak var trophiesLabel: UILabel!
    @IBOutlet weak var changeLabel: UILabel!
}
