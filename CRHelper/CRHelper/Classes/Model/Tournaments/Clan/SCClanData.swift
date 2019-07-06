//
//  SCClanData.swift
//  CRHelper
//
//  Created by Stephen Cao on 6/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

class SCClanData: NSObject {
    @objc var tag: String?
    @objc var name: String?
    @objc var type: String?
    @objc var desc: String?
    @objc var badgeId: String?
    @objc var clanScore: Int = 0
    @objc var location: SCClanLocation?
    @objc var clanWarTrophies: Int = 0
    @objc var requiredTrophies: Int = 0
    @objc var donationsPerWeek: Int = 0
    @objc var clanChestStatus: String?
    @objc var clanChestLevel: Int = 0
    @objc var clanChestMaxLevel: Int = 0
    @objc var members: Int = 0
    @objc var memberList: [SCClanMember]?
    
    @objc class func modelCustomPropertyMapper()->[String:String]{
        return ["desc": "description"]
    }
    @objc class func modelContainerPropertyGenericClass()->[String:AnyClass]{
        return ["memberList": SCClanMember.self]
    }
    override var description: String{
        return yy_modelDescription()
    }
}
