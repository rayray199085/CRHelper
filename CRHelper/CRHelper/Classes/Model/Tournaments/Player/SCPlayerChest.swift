//
//  SCPlayerChest.swift
//  CRHelper
//
//  Created by Stephen Cao on 5/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

class SCPlayerChest: NSObject {
    
    @objc var index: Int = 0
    @objc var name: String?
    
    override var description: String{
        return yy_modelDescription()
    }
}
