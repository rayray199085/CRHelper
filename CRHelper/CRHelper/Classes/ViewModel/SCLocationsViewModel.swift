//
//  SCLocationsViewModel.swift
//  CRHelper
//
//  Created by Stephen Cao on 8/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

class SCLocationsViewModel: SCBaseViewModel {
    var locationsData: SCLocationsData?
    var locationsNameList: [String]?
    var locationId: String?
    var clanRankingsData: SCLocationsClanRankingsData?
    var playerRankingsData: SCLocationsPlayerRankingsData?
    
    func loadLocationsList(completion:@escaping (_ isSuccess: Bool)->()){
        SCNetworkManager.shared.getLocationsList { (dict, isSuccess) in
            if !isSuccess{
                completion(false)
                return
            }
            guard let dict = dict,
                  let locationsData = SCLocationsData.yy_model(with: dict) else{
                    completion(false)
                    return
            }
            locationsData.items?.sort(by: { ($0.name ?? "") < ($1.name ?? "") })
            var array = [String]()
            for item in locationsData.items ?? []{
                guard let name = item.name else{
                    continue
                }
                array.append(name)
            }
            self.locationsNameList = array
            self.locationsData = locationsData
            completion(true)
        }
    }
}
extension SCLocationsViewModel{
    func loadLocationClanRankings(locationId: String?, completion:@escaping (_ isSuccess: Bool)->()){
        guard let id = locationId else{
            completion(false)
            return
        }
        SCNetworkManager.shared.getLocationsClanRankings(id: id) { (dict, isSuccess) in
            if !isSuccess{
                completion(false)
                return
            }
            guard let dict = dict,
                  let clanRankingsData = SCLocationsClanRankingsData.yy_model(with: dict) else{
                    completion(false)
                    return
            }
            self.clanRankingsData = clanRankingsData
            completion(true)
        }
    }
}
extension SCLocationsViewModel{
    func loadLocationPlayerRankings(locationId: String?, completion:@escaping (_ isSuccess: Bool)->()){
        guard let id = locationId else{
            completion(false)
            return
        }
        SCNetworkManager.shared.getLocationsPlayerRankings(id: id) { (dict, isSuccess) in
            if !isSuccess{
                completion(false)
                return
            }
            guard let dict = dict,
                  let playerRankingsData = SCLocationsPlayerRankingsData.yy_model(with: dict) else{
                    completion(false)
                    return
            }
            self.playerRankingsData = playerRankingsData
            completion(true)
        }
    }
}
