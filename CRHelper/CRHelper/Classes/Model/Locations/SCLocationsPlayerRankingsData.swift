//
//  SCLocationsPlayerRankingsData.swift
//  CRHelper
//
//  Created by Stephen Cao on 8/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

class SCLocationsPlayerRankingsData: NSObject {
    @objc var items: [SCLocationsPlayerRankingsItem]?
    
    @objc class func modelContainerPropertyGenericClass()->[String:AnyClass]{
        return ["items": SCLocationsPlayerRankingsItem.self]
    }
    
    override var description: String{
        return yy_modelDescription()
    }
}
