//
//  SCClanPastWarsItem.swift
//  CRHelper
//
//  Created by Stephen Cao on 7/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

class SCClanPastWarsItem: NSObject {
    @objc var seasonId: Int = 0
    @objc var createdDate: String?
    @objc var createdDateString: String?
    @objc var participants: [SCClanPastWarsParticipant]?
    @objc var standings: [SCClanPastWarsStanding]?
    
    @objc class func modelContainerPropertyGenericClass()->[String:AnyClass]{
        return ["participants": SCClanPastWarsParticipant.self,
                "standings": SCClanPastWarsStanding.self]
    }
    
    override var description: String{
        return yy_modelDescription()
    }
}
