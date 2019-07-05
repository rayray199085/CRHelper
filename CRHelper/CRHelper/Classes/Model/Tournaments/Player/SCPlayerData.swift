//
//  SCPlayerData.swift
//  CRHelper
//
//  Created by Stephen Cao on 5/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

class SCPlayerData: NSObject {
    @objc var tag: String?
    @objc var name: String?
    @objc var expLevel: Int = 0
    @objc var trophies: Int = 0
    @objc var bestTrophies: Int = 0
    @objc var wins: Int = 0
    @objc var losses: Int = 0
    
    @objc var battleCount: Int = 0
    @objc var threeCrownWins: Int = 0
    @objc var challengeCardsWon: Int = 0
    @objc var challengeMaxWins: Int = 0
    @objc var tournamentCardsWon: Int = 0
    @objc var tournamentBattleCount: Int = 0
    
    @objc var role: String?
    @objc var donations: Int = 0
    @objc var donationsReceived: Int = 0
    @objc var totalDonations: Int = 0
    @objc var warDayWins: Int = 0
    @objc var clanCardsCollected: Int = 0
    
    @objc var clan: SCTournamentClan?
    @objc var arena: SCPlayerArena?
    @objc var badges: [SCPlayerBadge]?
    
    @objc var achievements: [SCPlayerAchievement]?
    @objc var cards: [SCCardsDataItem]?
    @objc var currentDeck: [SCCardsDataItem]?
    @objc var currentFavouriteCard: SCCardsDataItem?
    
    @objc class func modelContainerPropertyGenericClass()->[String:AnyClass]{
        return ["achievements": SCPlayerAchievement.self,
                "cards": SCCardsDataItem.self,
                "currentDeck": SCCardsDataItem.self,
                "badges": SCPlayerBadge.self]
    }
    override var description: String{
        return yy_modelDescription()
    }
}
