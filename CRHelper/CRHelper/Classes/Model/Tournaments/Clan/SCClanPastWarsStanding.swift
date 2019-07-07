//
//  SCClanPastWarsStanding.swift
//  CRHelper
//
//  Created by Stephen Cao on 7/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

class SCClanPastWarsStanding: NSObject {
    
    @objc var clan: SCClanPastWarsClan?
    @objc var trophyChange: Int = 0

    override var description: String{
        return yy_modelDescription()
    }
}
