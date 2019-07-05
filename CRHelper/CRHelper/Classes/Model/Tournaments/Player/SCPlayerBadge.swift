//
//  SCPlayerBadge.swift
//  CRHelper
//
//  Created by Stephen Cao on 5/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

class SCPlayerBadge: NSObject {
    @objc var progress: Int = 0
    @objc var name: String?
    
    override var description: String{
        return yy_modelDescription()
    }
}
