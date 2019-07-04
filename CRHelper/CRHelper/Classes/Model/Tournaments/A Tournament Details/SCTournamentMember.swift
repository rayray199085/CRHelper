//
//  SCTournamentMember.swift
//  CRHelper
//
//  Created by Stephen Cao on 4/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

class SCTournamentMember: NSObject {
    @objc var tag: String?
    @objc var name: String?
    @objc var score: Int = 0
    @objc var rank: Int = 0
    @objc var clan: SCTournamentClan?
    
    override var description: String{
        return yy_modelDescription()
    }
}
