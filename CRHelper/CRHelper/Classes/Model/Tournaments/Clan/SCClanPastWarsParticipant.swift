//
//  SCClanPastWarsParticipant.swift
//  CRHelper
//
//  Created by Stephen Cao on 7/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

class SCClanPastWarsParticipant: NSObject {
    @objc var tag: String?
    @objc var name: String?
    @objc var cardsEarned: Int = 0
    @objc var battlesPlayed: Int = 0
    @objc var wins: Int = 0
    @objc var collectionDayBattlesPlayed: Int = 0
    @objc var numberOfBattles: Int = 0
    @objc var rank: Int = 1
    
    override var description: String{
        return yy_modelDescription()
    }
}
