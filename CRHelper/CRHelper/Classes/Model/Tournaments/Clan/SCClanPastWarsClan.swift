//
//  SCClanPastWarsClan.swift
//  CRHelper
//
//  Created by Stephen Cao on 7/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

class SCClanPastWarsClan: NSObject {
    @objc var tag: String?
    @objc var name: String?
    @objc var badgeId: String?
    @objc var clanScore: Int = 0
    @objc var participants: Int = 0
    @objc var battlesPlayed: Int = 0
    @objc var wins: Int = 0
    @objc var crowns: Int = 0
    @objc var rank: Int = 1
    
    override var description: String{
        return yy_modelDescription()
    }
}
