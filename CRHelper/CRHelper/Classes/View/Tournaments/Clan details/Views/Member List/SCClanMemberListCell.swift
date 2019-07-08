//
//  SCClanMemberListCell.swift
//  CRHelper
//
//  Created by Stephen Cao on 6/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

class SCClanMemberListCell: UITableViewCell {
    var member: SCClanMember?{
        didSet{
            nameLabel.text = member?.name
            lastSeenLabel.text = member?.lastSeenString
            clanRankLabel.text = "\(member?.clanRank ?? 1)"
            roleLabel.text = member?.role
            expLevelLabel.text = "\(member?.expLevel ?? 0)"
            trophyLabel.text = "\(member?.trophies ?? 0)"
            donationLabel.text = "\(member?.donations ?? 0)"
            donationReceivedLabel.text = "\(member?.donationsReceived ?? 0)"
            clanChestPointsLabel.text = "\(member?.clanChestPoints ?? 0)"
            arenaLabel.text = member?.arena?.name
        }
    }
    
    @IBOutlet weak var arenaLabel: UILabel!
    @IBOutlet weak var clanRankLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastSeenLabel: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    @IBOutlet weak var expLevelLabel: UILabel!
    @IBOutlet weak var trophyLabel: UILabel!
    @IBOutlet weak var donationLabel: UILabel!
    @IBOutlet weak var donationReceivedLabel: UILabel!
    @IBOutlet weak var clanChestPointsLabel: UILabel!
}
