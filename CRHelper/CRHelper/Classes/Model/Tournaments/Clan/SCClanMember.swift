//
//  SCClanMember.swift
//  CRHelper
//
//  Created by Stephen Cao on 6/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

class SCClanMember: NSObject {
    @objc var tag: String?
    @objc var name: String?
    @objc var role: String?
    @objc var lastSeen: String?
    @objc var lastSeenString: String?
    @objc var expLevel: Int = 0
    @objc var trophies: Int = 0
    @objc var arena: SCPlayerArena?
    @objc var clanRank: Int = 0
    @objc var previousClanRank: Int = 0
    @objc var donations: Int = 0
    @objc var donationsReceived: Int = 0
    @objc var clanChestPoints: Int = 0

    override var description: String{
        return yy_modelDescription()
    }
}
