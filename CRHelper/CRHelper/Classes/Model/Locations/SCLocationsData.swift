//
//  SCLocationsData.swift
//  CRHelper
//
//  Created by Stephen Cao on 8/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

class SCLocationsData: NSObject {
    @objc var items: [SCLocationsItem]?
    
    @objc class func modelContainerPropertyGenericClass()->[String:AnyClass]{
        return ["items": SCLocationsItem.self]
    }
    
    override var description: String{
        return yy_modelDescription()
    }
}
