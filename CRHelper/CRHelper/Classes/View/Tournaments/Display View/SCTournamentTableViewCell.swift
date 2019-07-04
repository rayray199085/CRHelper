//
//  SCTournamentTableViewCell.swift
//  CRHelper
//
//  Created by Stephen Cao on 4/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

class SCTournamentTableViewCell: UITableViewCell {
    
    var dataItem: SCTournamentsDataItem?{
        didSet{
            tournamentNameLabel.text = dataItem?.name
            tagLabel.text = dataItem?.tag
            capacityLabel.text = "\(dataItem?.capacity ?? 0)/\(dataItem?.maxCapacity ?? 0)"
            endsInLabel.text = dataItem?.remainingTime
            statusLabel.text = dataItem?.status
            typeLabel.text = dataItem?.type
            creatorTagLabel.text = dataItem?.creatorTag
            descriptionLabel.text = dataItem?.desc
        }
    }
    
    @IBOutlet weak var tournamentNameLabel: UILabel!
    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var endsInLabel: UILabel!
    @IBOutlet weak var capacityLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var creatorTagLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
}
