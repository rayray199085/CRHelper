//
//  SCLocationsPlayerRankingsItem.swift
//  CRHelper
//
//  Created by Stephen Cao on 8/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

class SCLocationsPlayerRankingsItem: NSObject {
    @objc var tag: String?
    @objc var name: String?
    @objc var expLevel: Int = 0
    @objc var trophies: Int = 0
    @objc var rank: Int = 1
    @objc var previousRank: Int = 1
    @objc var clan: SCTournamentClan?
    @objc var arena: SCPlayerArena?
    
    override var description: String{
        return yy_modelDescription()
    }
}
