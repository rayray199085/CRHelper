//
//  SCPlayerAchievement.swift
//  CRHelper
//
//  Created by Stephen Cao on 5/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

class SCPlayerAchievement: NSObject {
    @objc var stars: Int = 0
    @objc var value: Int = 0
    @objc var target: Int = 0
    @objc var info: String?
    @objc var name: String?
    
    override var description: String{
        return yy_modelDescription()
    }
}
