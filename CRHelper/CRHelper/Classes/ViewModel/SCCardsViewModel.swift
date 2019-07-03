//
//  SCCardsViewModel.swift
//  AirQualityAssistant
//
//  Created by Stephen Cao on 2/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import Foundation

class SCCardsViewModel{
    var cardData: SCCardsData?
    
    func loadCardsData(completion:@escaping (_ isSuccess: Bool)->()){
        SCNetworkManager.shared.getCardsData { (dict, isSuccess) in
            if !isSuccess{
                completion(false)
                return
            }
            guard let dict = dict,
                  let cardData = SCCardsData.yy_model(with: dict) else{
                completion(false)
                return
            }
            let group = DispatchGroup()
            
            for item in cardData.items ?? []{
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
                self.cardData = cardData
                completion(true)
            })
            
        }
    }
}
