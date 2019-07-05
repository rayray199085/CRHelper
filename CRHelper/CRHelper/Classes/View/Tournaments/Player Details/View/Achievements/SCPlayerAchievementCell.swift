//
//  SCPlayerAchievementCell.swift
//  CRHelper
//
//  Created by Stephen Cao on 5/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

class SCPlayerAchievementCell: UITableViewCell {
    var achievement: SCPlayerAchievement?{
        didSet{
            nameLabel.text = achievement?.name
            infoLabel.text = achievement?.info
            for v in starStackView.subviews{
                v.isHidden = true
            }
            var startCount = achievement?.stars ?? 0
            startCount = startCount > 3 ? 3 : startCount
            for index in 0..<startCount{
                let v = starStackView.subviews[index]
                v.isHidden = false
            }
        }
    }
    
    @IBOutlet weak var starStackView: UIStackView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
}
