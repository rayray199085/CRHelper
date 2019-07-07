//
//  SCClanPastWarsData.swift
//  CRHelper
//
//  Created by Stephen Cao on 7/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

class SCClanPastWarsData: NSObject {
    @objc var items: [SCClanPastWarsItem]?
    
    @objc class func modelContainerPropertyGenericClass()->[String:AnyClass]{
        return ["items": SCClanPastWarsItem.self]
    }
    
    override var description: String{
        return yy_modelDescription()
    }
}
