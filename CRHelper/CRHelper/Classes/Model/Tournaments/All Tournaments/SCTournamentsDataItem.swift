//
//  SCTournamentsDataItem.swift
//  CRHelper
//
//  Created by Stephen Cao on 4/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

class SCTournamentsDataItem: NSObject {
    @objc var capacity: Int = 0
    @objc var createdTime: String?
    @objc var remainingTime:String?
    @objc var remainingTimeInterval: TimeInterval = 0
    @objc var creatorTag: String?
    @objc var desc: String?
    @objc var duration: TimeInterval = 0
    @objc var firstPlaceCardPrize: Int = 0
    @objc var gameMode: SCTournamentsGameMode?
    @objc var levelCap: Int = 0
    @objc var maxCapacity: Int = 0
    @objc var name: String?
    @objc var preparationDuration: TimeInterval = 0
    @objc var status: String?
    @objc var tag: String?
    @objc var type: String?
    @objc var rowHeight: CGFloat = 0
  
    @objc class func modelCustomPropertyMapper()->[String:String]{
        return ["desc": "description"]
    }
    override var description: String{
        return yy_modelDescription()
    }
}
