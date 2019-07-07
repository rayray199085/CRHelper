//
//  SCClanPastWarsParticipantsCell.swift
//  CRHelper
//
//  Created by Stephen Cao on 7/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

class SCClanPastWarsParticipantsCell: UITableViewCell {
    var participant: SCClanPastWarsParticipant?{
        didSet{
            nameLabel.text = participant?.name
            rankLabel.text = "#\(participant?.rank ?? 1)"
            battleLabel.text = "\(participant?.battlesPlayed ?? 0) / \(participant?.numberOfBattles ?? 0)"
            winsLabel.text = "\(participant?.wins ?? 0)"
            cardsLabel.text = "\(participant?.cardsEarned ?? 0)"
        }
    }
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var battleLabel: UILabel!
    @IBOutlet weak var winsLabel: UILabel!
    @IBOutlet weak var cardsLabel: UILabel!
}
