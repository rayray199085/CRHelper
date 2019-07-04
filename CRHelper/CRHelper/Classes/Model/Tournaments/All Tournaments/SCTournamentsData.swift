//
//  SCTournamentsData.swift
//  CRHelper
//
//  Created by Stephen Cao on 4/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit
import YYModel

class SCTournamentsData: NSObject {
    @objc var items: [SCTournamentsDataItem]?
    
    @objc class func modelContainerPropertyGenericClass()->[String:AnyClass]{
        return ["items": SCTournamentsDataItem.self]
    }
    
    override var description: String{
        return yy_modelDescription()
    }
}
