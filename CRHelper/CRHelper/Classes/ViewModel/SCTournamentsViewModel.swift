//
//  SCTournamentsViewModel.swift
//  CRHelper
//
//  Created by Stephen Cao on 4/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import Foundation

class SCTournamentsViewModel{
    var tournamentsData: SCTournamentsData?
    var detailsData: SCTournamentsDetailsData?
    var playerData: SCPlayerData?
    var cardDataItems: [SCCardsDataItem]?
    var deckDataItems: [SCCardsDataItem]?
    var chestData: SCPlayerChestData?
    
    func resetPlayData(){
        chestData = nil
        playerData = nil
        cardDataItems = nil
        deckDataItems = nil
    }
    
    func loadTournamentsData(name: String?, completion:@escaping (_ isSuccess: Bool)->()){
        guard let name = name else{
            completion(false)
            return
        }
        SCNetworkManager.shared.getTournamentsData(name: name) { (dict, isSuccess) in
            if !isSuccess{
                completion(false)
                return
            }
            guard let dict = dict,
                  let tournamentsData = SCTournamentsData.yy_model(with: dict) else{
                completion(false)
                return
            }
           
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US")
            dateFormatter.dateFormat = "yyyyMMdd'T'HHmmss.SSSZ"
    
            for item in tournamentsData.items ?? []{
                guard let createdTime = item.createdTime,
                     var date = dateFormatter.date(from: createdTime) else{
                    continue
                }
                date.addTimeInterval(item.duration + item.preparationDuration)
                let remainingTimeInterval = date.timeIntervalSinceNow
                item.remainingTimeInterval = remainingTimeInterval
                item.remainingTime =  remainingTimeInterval.stringTime
                item.rowHeight = self.updateRowHeight(name: item.desc ?? "")
            }
            tournamentsData.items?.sort(by: { $0.remainingTimeInterval < $1.remainingTimeInterval })
            self.tournamentsData = tournamentsData
            completion(true)
        }
    }
    
    func updateRowHeight(name: String)->CGFloat{
        let margin: CGFloat = 3
        let labelWidth: CGFloat = 90
        let labelHeight: CGFloat = 18
        var height = (margin + labelHeight) * 7
        let viewSize = CGSize(width: UIScreen.main.bounds.width - 2 * margin - labelWidth, height: CGFloat(MAXFLOAT))
        height += margin
        height += NSAttributedString(string: name, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)])
            .boundingRect(with: viewSize, options: [.usesLineFragmentOrigin], context: nil)
            .height
        height += margin * 4
        return height
    }
}
extension SCTournamentsViewModel{
    func loadTournamentsDetailsData(tag: String?, completion:@escaping (_ isSuccess: Bool)->()){
        guard let tag = tag else{
            completion(false)
            return
        }
        SCNetworkManager.shared.getTournamentDetailsData(tag: tag) { (dict, isSuccess) in
            if !isSuccess{
                completion(false)
                return
            }
            guard let dict = dict,
                let detailsData = SCTournamentsDetailsData.yy_model(with: dict) else{
                    completion(false)
                    return
            }
            self.detailsData = detailsData
            completion(true)
        }
    }
}
extension SCTournamentsViewModel{
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
extension SCTournamentsViewModel{
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

extension SCTournamentsViewModel{
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
extension SCTournamentsViewModel{
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
