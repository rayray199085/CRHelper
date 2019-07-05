//
//  SCPlayerChestData.swift
//  CRHelper
//
//  Created by Stephen Cao on 5/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

class SCPlayerChestData: NSObject {
    @objc var items: [SCPlayerChest]?
    
    @objc class func modelContainerPropertyGenericClass()->[String:AnyClass]{
        return ["items": SCPlayerChest.self]
    }
}
