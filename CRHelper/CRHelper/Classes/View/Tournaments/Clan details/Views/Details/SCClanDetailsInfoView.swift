
//
//  SCClanDetailsInfoView.swift
//  CRHelper
//
//  Created by Stephen Cao on 6/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

class SCClanDetailsInfoView: UIView {
    var viewModel: SCBaseViewModel?{
        didSet{
            nameLabel.text = viewModel?.clanData?.name
            locationLabel.text = viewModel?.clanData?.location?.name
            typeLabel.text = viewModel?.clanData?.type
            memberCountLabel.text = "\(viewModel?.clanData?.members ?? 0)"
            clanScoreLabel.text = "\(viewModel?.clanData?.clanScore ?? 0)"
            clanWarTrophiesLabel.text = "\(viewModel?.clanData?.clanWarTrophies ?? 0)"
            requiredTrophiesLabel.text = "\(viewModel?.clanData?.requiredTrophies ?? 0)"
            donationsPerWeekLabel.text = "\(viewModel?.clanData?.donationsPerWeek ?? 0)"
            clanChestStatusLabel.text = viewModel?.clanData?.clanChestStatus
            clanChestLevelLabel.text = "\(viewModel?.clanData?.clanChestLevel ?? 0)"
            clanChestMaxLevelLabel.text = "\(viewModel?.clanData?.clanChestMaxLevel ?? 0)"
            descriptionTextView.text = viewModel?.clanData?.desc
        }
    }
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var memberCountLabel: UILabel!
    @IBOutlet weak var clanScoreLabel: UILabel!
    @IBOutlet weak var clanWarTrophiesLabel: UILabel!
    @IBOutlet weak var requiredTrophiesLabel: UILabel!
    @IBOutlet weak var donationsPerWeekLabel: UILabel!
    @IBOutlet weak var clanChestStatusLabel: UILabel!
    @IBOutlet weak var clanChestLevelLabel: UILabel!
    @IBOutlet weak var clanChestMaxLevelLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    
    class func infoView()->SCClanDetailsInfoView{
        let nib = UINib(nibName: "SCClanDetailsInfoView", bundle: nil)
        let v = nib.instantiate(withOwner: self, options: nil)[0] as! SCClanDetailsInfoView
        v.frame = UIScreen.main.bounds
        return v
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        descriptionTextView.textContainerInset = UIEdgeInsets(top: 0, left: -5, bottom: 0, right: 0)
    }
}
