//
//  SCCardsData.swift
//  CRHelper
//
//  Created by Stephen Cao on 3/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

class SCCardsDataItem: NSObject {
    @objc var iconUrls: SCCardsUrlItem?
    @objc var id: String?
    @objc var maxLevel: Int = 0
    @objc var name: String?
    @objc var level: Int = 0
    @objc var count: Int = 0
        
    override var description: String{
        return yy_modelDescription()
    }
}
