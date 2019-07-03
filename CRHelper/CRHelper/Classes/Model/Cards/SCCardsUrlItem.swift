//
//  SCCardsUrlItem.swift
//  CRHelper
//
//  Created by Stephen Cao on 3/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

class SCCardsUrlItem: NSObject {
    @objc var medium: String?
    @objc var cardImage: UIImage?
    
    override var description: String{
        return yy_modelDescription()
    }
}
