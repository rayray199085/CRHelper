//
//  SCClanWarData.swift
//  CRHelper
//
//  Created by Stephen Cao on 7/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

class SCClanWarData: NSObject {
    @objc var state: String?
    @objc var collectionEndTime: String?
    @objc var warEndTime: String?
    @objc var endTimeString: String?
    @objc var clan: SCClanPastWarsClan?
    @objc var participants: [SCClanPastWarsParticipant]?
    
    @objc class func modelContainerPropertyGenericClass()->[String:AnyClass]{
        return ["participants": SCClanPastWarsParticipant.self]
    }
    override var description: String{
        return yy_modelDescription()
    }
}
