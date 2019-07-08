//
//  SCLocationsClanRankingsItem.swift
//  CRHelper
//
//  Created by Stephen Cao on 8/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

class SCLocationsClanRankingsItem: NSObject {
    @objc var badgeId: String?
    @objc var clanScore: Int = 0
    @objc var location: SCLocationsItem?
    @objc var members: Int = 0
    @objc var name: String?
    @objc var previousRank: Int = 0
    @objc var rank: Int = 0
    @objc var tag: String?
    
    override var description: String{
        return yy_modelDescription()
    }
}
