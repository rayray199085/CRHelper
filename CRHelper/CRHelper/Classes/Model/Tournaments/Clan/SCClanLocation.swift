//
//  SCClanLocation.swift
//  CRHelper
//
//  Created by Stephen Cao on 6/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

class SCClanLocation: NSObject {
    @objc var id: String?
    @objc var name: String?
    @objc var isCountry: Int = 0
   
    override var description: String{
        return yy_modelDescription()
    }
}
