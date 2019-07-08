//
//  SCTournamentPlayerCell.swift
//  CRHelper
//
//  Created by Stephen Cao on 5/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

protocol SCTournamentPlayerCellDelegate: NSObjectProtocol {
    func didClickClanButton(view: SCTournamentPlayerCell, clanTag: String?)
}
class SCTournamentPlayerCell: UITableViewCell {
    weak var delegate: SCTournamentPlayerCellDelegate?
    
    var member: SCTournamentMember?{
        didSet{
            playerLabel.text = member?.name
            trophiesLabel.text = "\(member?.score ?? 0)"
            clanButton.setTitle(member?.clan?.name, for: [])
            rankLabel.text = "#\(member?.rank ?? 1)"
        }
    }
    
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var playerLabel: UILabel!
    
    @IBOutlet weak var trophiesLabel: UILabel!
    @IBOutlet weak var clanButton: UIButton!
    
    @IBAction func clickClanButton(_ sender: Any) {
        delegate?.didClickClanButton(view: self, clanTag: member?.clan?.tag)
    }
}
