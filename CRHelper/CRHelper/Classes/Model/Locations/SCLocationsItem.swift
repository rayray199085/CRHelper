//
//  SCLocationsItem.swift
//  CRHelper
//
//  Created by Stephen Cao on 8/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

class SCLocationsItem: NSObject {
    @objc var countryCode: String?
    @objc var id: String?
    @objc var isCountry: Int = 0
    @objc var name: String?
    
    override var description: String{
        return yy_modelDescription()
    }
}
