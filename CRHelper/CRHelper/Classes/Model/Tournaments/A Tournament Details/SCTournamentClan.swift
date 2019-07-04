//
//  SCTournamentClan.swift
//  CRHelper
//
//  Created by Stephen Cao on 4/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

class SCTournamentClan: NSObject {
    @objc var tag: String?
    @objc var name: String?
    @objc var badgeId: String?
    
    override var description: String{
        return yy_modelDescription()
    }
}
