//
//  SCPlayerStatsViewController.swift
//  CRHelper
//
//  Created by Stephen Cao on 5/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

class SCPlayerStatsViewController: UITableViewController {
    var viewModel: SCBaseViewModel?{
        didSet{
            nameLabel.text = viewModel?.playerData?.name
            clanLabel.text = viewModel?.playerData?.clan?.name
            roleLabel.text = viewModel?.playerData?.role
            expLabel.text = "\(viewModel?.playerData?.expLevel ?? 0)"
            
            TRhighestTrophies.text = "\(viewModel?.playerData?.bestTrophies ?? 0)"
            TRtrophies.text = "\(viewModel?.playerData?.trophies ?? 0)"
            
            SRwins.text = "\(viewModel?.playerData?.wins ?? 0)"
            SRlosses.text = "\(viewModel?.playerData?.losses ?? 0)"
            SRthreeCrownWins.text = "\(viewModel?.playerData?.threeCrownWins ?? 0)"
            SRtotalDonations.text = "\(viewModel?.playerData?.totalDonations ?? 0)"
            
            CWSwarDayWins.text = "\(viewModel?.playerData?.warDayWins ?? 0)"
            CWSclanCardsCollected.text = "\(viewModel?.playerData?.clanCardsCollected ?? 0)"
            
            CSmaxWins.text = "\(viewModel?.playerData?.challengeMaxWins ?? 0)"
            CScardsWon.text = "\(viewModel?.playerData?.challengeCardsWon ?? 0)"
            CSmatchesPlayed.text = "\(viewModel?.playerData?.battleCount ?? 0)"
            
            TSmatchesPlayed.text = "\(viewModel?.playerData?.tournamentBattleCount ?? 0)"
            TScardsWon.text = "\(viewModel?.playerData?.tournamentCardsWon ?? 0)"
            
            
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var clanLabel: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    @IBOutlet weak var expLabel: UILabel!
    @IBOutlet weak var TRhighestTrophies: UILabel!
    @IBOutlet weak var TRtrophies: UILabel!
    @IBOutlet weak var SRwins: UILabel!
    @IBOutlet weak var SRlosses: UILabel!
    @IBOutlet weak var SRthreeCrownWins: UILabel!
    @IBOutlet weak var SRtotalDonations: UILabel!
    @IBOutlet weak var CWSwarDayWins: UILabel!
    @IBOutlet weak var CWSclanCardsCollected: UILabel!
    @IBOutlet weak var CSmaxWins: UILabel!
    @IBOutlet weak var CScardsWon: UILabel!
    @IBOutlet weak var CSmatchesPlayed: UILabel!
    @IBOutlet weak var TSmatchesPlayed: UILabel!
    @IBOutlet weak var TScardsWon: UILabel!
    @IBOutlet weak var TS1kTournamentsWon: UILabel!
    @IBOutlet weak var TS1kTournamentsTop10: UILabel!
    @IBOutlet weak var PSrank: UILabel!
    @IBOutlet weak var PShighestTrophies: UILabel!
    @IBOutlet weak var PSTrophies: UILabel!
    @IBOutlet weak var BSseason: UILabel!
    @IBOutlet weak var BSrank: UILabel!
    @IBOutlet weak var BStrophies: UILabel!
    @IBOutlet weak var LSleague: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

}
