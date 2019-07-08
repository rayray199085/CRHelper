//
//  SCLocationsClanRankingsData.swift
//  CRHelper
//
//  Created by Stephen Cao on 8/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

class SCLocationsClanRankingsData: NSObject {
    @objc var items: [SCLocationsClanRankingsItem]?
    
    @objc class func modelContainerPropertyGenericClass()->[String:AnyClass]{
        return ["items": SCLocationsClanRankingsItem.self]
    }
    
    override var description: String{
        return yy_modelDescription()
    }
}
