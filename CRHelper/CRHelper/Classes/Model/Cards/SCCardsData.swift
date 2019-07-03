//
//  SCCardsData.swift
//  CRHelper
//
//  Created by Stephen Cao on 3/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

class SCCardsData: NSObject {
    @objc var items: [SCCardsDataItem]?
    
    @objc class func modelContainerPropertyGenericClass()->[String:AnyClass]{
        return ["items": SCCardsDataItem.self]
    }
    
    override var description: String{
        return yy_modelDescription()
    }
}
