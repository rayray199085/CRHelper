//
//  SCTournamentsViewModel.swift
//  CRHelper
//
//  Created by Stephen Cao on 4/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import Foundation

class SCTournamentsViewModel: SCBaseViewModel{
    var tournamentsData: SCTournamentsData?
    var detailsData: SCTournamentsDetailsData?
    
//    load tournament basic info
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
               
            for item in tournamentsData.items ?? []{
                guard let createdTime = item.createdTime,
                     var date = self.dateFormatter.date(from: createdTime) else{
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
// load tournament details
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

