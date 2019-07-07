//
//  SCBaseViewModel.swift
//  CRHelper
//
//  Created by Stephen Cao on 6/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

class SCBaseViewModel: NSObject {
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.dateFormat = "yyyyMMdd'T'HHmmss.SSSZ"
        return formatter
    }()
    var playerData: SCPlayerData?
    var cardDataItems: [SCCardsDataItem]?
    var deckDataItems: [SCCardsDataItem]?
    var chestData: SCPlayerChestData?
    // for clan info
    var clanData: SCClanData?
    var pastWarsData: SCClanPastWarsData?
    var warData: SCClanWarData?
    
    func resetPlayData(){
        playerData = nil
        chestData = nil
        cardDataItems = nil
        deckDataItems = nil
    }
}

// load player basic info
extension SCBaseViewModel{
    func loadPlayerData(tag: String?, completion:@escaping (_ isSuccess: Bool)->()){
        guard let tag = tag else{
            completion(false)
            return
        }
        SCNetworkManager.shared.getPlayerData(tag: tag) { (dict, isSuccess) in
            if !isSuccess{
                completion(false)
                return
            }
            guard let dict = dict,
                let playerData = SCPlayerData.yy_model(with: dict) else{
                    completion(false)
                    return
            }
            self.playerData = playerData
            completion(true)
        }
    }
}
// load cards data
extension SCBaseViewModel{
    func loadCardsData(completion:@escaping (_ isSuccess: Bool)->()){
        let group = DispatchGroup()
        for item in playerData?.cards ?? []{
            guard let urlString = item.iconUrls?.medium else{
                continue
            }
            group.enter()
            SCNetworkManager.shared.getCardImage(imageUrlString: urlString, completion: { (image) in
                item.iconUrls?.cardImage = image
                group.leave()
            })
        }
        group.notify(queue: DispatchQueue.main, execute: {
            self.cardDataItems = self.playerData?.cards
            completion(true)
        })
    }
}
// load deck data
extension SCBaseViewModel{
    func loadDeckData(completion:@escaping (_ isSuccess: Bool)->()){
        let group = DispatchGroup()
        for item in playerData?.currentDeck ?? []{
            guard let urlString = item.iconUrls?.medium else{
                continue
            }
            group.enter()
            SCNetworkManager.shared.getCardImage(imageUrlString: urlString, completion: { (image) in
                item.iconUrls?.cardImage = image
                group.leave()
            })
        }
        group.notify(queue: DispatchQueue.main, execute: {
            self.deckDataItems = self.playerData?.currentDeck
            completion(true)
        })
    }
}
// load chest data
extension SCBaseViewModel{
    func loadChestData(completion:@escaping (_ isSuccess: Bool)->()){
        guard let tag = playerData?.tag else{
            completion(false)
            return
        }
        SCNetworkManager.shared.getPlayerChest(tag: tag) { (dict, isSuccess) in
            if !isSuccess{
                completion(false)
                return
            }
            guard let dict = dict,
                let chestData = SCPlayerChestData.yy_model(with: dict) else{
                    completion(false)
                    return
            }
            self.chestData = chestData
            completion(true)
        }
    }
}
// load clan info by tag
extension SCBaseViewModel{
    func loadClanData(clanTag: String?,completion:@escaping (_ isSuccess: Bool)->()){
        guard let tag = clanTag else{
            completion(false)
            return
        }
        SCNetworkManager.shared.getClanData(tag: tag) { (dict, isSuccess) in
            if !isSuccess{
                completion(false)
                return
            }
            guard let dict = dict,
                let clanData = SCClanData.yy_model(with: dict) else{
                    completion(false)
                    return
            }
            
            for member in clanData.memberList ?? []{
                guard let lastSeen = member.lastSeen,
                      let date = self.dateFormatter.date(from: lastSeen) else{
                    continue
                }
                member.lastSeenString = date.sinaDateStringDescription
            }
            self.clanData = clanData
            completion(true)
        }
    }
}
extension SCBaseViewModel{
    func loadClanPastWarsData(completion:@escaping (_ isSuccess: Bool)->()){
        guard let tag = self.clanData?.tag else{
            completion(false)
            return
        }
        SCNetworkManager.shared.getClanPastWarsData(tag: tag) { (dict, isSuccess) in
            if !isSuccess{
                completion(false)
                return
            }
            guard let dict = dict,
                  let pastWarsData = SCClanPastWarsData.yy_model(with: dict) else{
                completion(false)
                return
            }
            for item in pastWarsData.items ?? []{
                guard let createdDate = item.createdDate,
                     let date = self.dateFormatter.date(from: createdDate)else{
                    continue
                }
                item.createdDateString = date.sinaDateStringDescription
                
                var participantRank = 1
                for participant in item.participants ?? [] {
                    participant.rank = participantRank
                    participantRank += 1
                }
                var standingRank = 1
                for standing in item.standings ?? []{
                    standing.clan?.rank = standingRank
                    standingRank += 1
                }
            }
            self.pastWarsData = pastWarsData
            completion(true)
        }
    }
}
extension SCBaseViewModel{
    func loadClanWarData(completion:@escaping (_ isSuccess: Bool)->()){
        guard let tag = self.clanData?.tag else{
            completion(false)
            return
        }
        SCNetworkManager.shared.getClanWarsData(tag: tag) { (dict, isSuccess) in
            if !isSuccess{
                completion(false)
                return
            }
            guard let dict = dict,
                  let warData = SCClanWarData.yy_model(with: dict) else{
                completion(false)
                return
            }
            warData.participants?.sort(by: { $0.cardsEarned > $1.cardsEarned})
            var dateString: String?
            if warData.collectionEndTime != nil && (warData.collectionEndTime?.count ?? 0) > 0{
                dateString = warData.collectionEndTime
            }else{
                dateString = warData.warEndTime
            }
            if let dateString = dateString,
               let date = self.dateFormatter.date(from: dateString){
                print(date)
                let remainingTimeInterval = date.timeIntervalSinceNow
                warData.endTimeString = remainingTimeInterval.stringTime
            }
            var position = -1
            if let state = warData.state {
                for (index,c) in state.enumerated(){
                    if c.isUppercase{
                        position = index
                        break
                    }
                }
                if position != -1{
                    let leftSub = (state as NSString).substring(with: NSRange(location: 0, length: position))
                    let rightSub = (state as NSString).substring(from: position)
                    warData.state = "\(leftSub) \(rightSub)"
                }
            }
            warData.state?.capitalizeFirstLetter()
            var participantRank = 1
            for participant in warData.participants ?? []{
                participant.rank = participantRank
                participantRank += 1
            }
            self.warData = warData
            completion(true)
        }
    }
}
