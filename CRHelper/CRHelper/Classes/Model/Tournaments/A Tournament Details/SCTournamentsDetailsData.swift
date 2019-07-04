//
//  SCTournamentsDetailsData.swift
//  CRHelper
//
//  Created by Stephen Cao on 4/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

class SCTournamentsDetailsData: NSObject {
    @objc var creatorTag: String?
    @objc var membersList: [SCTournamentMember]?
    
    @objc class func modelContainerPropertyGenericClass()->[String:AnyClass]{
        return ["membersList": SCTournamentMember.self]
    }
    override var description: String{
        return yy_modelDescription()
    }
}
