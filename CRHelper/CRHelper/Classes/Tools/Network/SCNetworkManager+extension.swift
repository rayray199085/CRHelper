//
//  SCNetworkManager+extension.swift
//  WowLittleHelper
//
//  Created by Stephen Cao on 15/5/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import Foundation
import Alamofire
import SVProgressHUD

extension SCNetworkManager{
    func getCardsData(completion:@escaping (_ dict: [String: Any]?,_ isSuccess: Bool)->()){
        let urlString = "https://api.clashroyale.com/v1/cards"
        let params = ["authorization": "Bearer \(HelperCommon.apiKey)"]
        request(urlString: urlString, method: HTTPMethod.get, params: params) { (res, isSuccess, _, _) in
            let dict = res as? [String: Any]
            completion(dict, isSuccess)
        }
    }
    func getCardImage(imageUrlString: String, completion:@escaping (_ image: UIImage?)->()){
        guard let url = URL(string: imageUrlString) else{
            completion(nil)
            return
        }
        UIImage.downloadImage(url: url) { (image) in
            completion(image)
        }
    }
}
extension SCNetworkManager{
    func getTournamentsData(name: String, completion:@escaping (_ dict: [String: Any]?,_ isSuccess: Bool)->()){
        let urlString = "https://api.clashroyale.com/v1/tournaments"
        let params = ["authorization": "Bearer \(HelperCommon.apiKey)", "name": name]
        request(urlString: urlString, method: HTTPMethod.get, params: params) { (res, isSuccess, _, _) in
            let dict = res as? [String: Any]
            completion(dict, isSuccess)
        }
    }
    
    func getTournamentDetailsData(tag: String, completion:@escaping (_ dict: [String: Any]?,_ isSuccess: Bool)->()){
        let urlString = "https://api.clashroyale.com/v1/tournaments/\((tag as NSString).replacingOccurrences(of: "#", with: "%23"))"
        let params = ["authorization": "Bearer \(HelperCommon.apiKey)"]
        request(urlString: urlString, method: HTTPMethod.get, params: params) { (res, isSuccess, _, _) in
            let dict = res as? [String: Any]
            completion(dict, isSuccess)
        }
    }
}
extension SCNetworkManager{
    func getPlayerData(tag: String, completion:@escaping (_ dict: [String: Any]?,_ isSuccess: Bool)->()){
        let urlString = "https://api.clashroyale.com/v1/players/\((tag as NSString).replacingOccurrences(of: "#", with: "%23"))"
        let params = ["authorization": "Bearer \(HelperCommon.apiKey)"]
        request(urlString: urlString, method: HTTPMethod.get, params: params) { (res, isSuccess, _, _) in
            let dict = res as? [String: Any]
            completion(dict, isSuccess)
        }
    }
    
    func getPlayerChest(tag: String, completion:@escaping (_ dict: [String: Any]?,_ isSuccess: Bool)->()){
        let urlString = "https://api.clashroyale.com/v1/players/\((tag as NSString).replacingOccurrences(of: "#", with: "%23"))/upcomingchests"
        let params = ["authorization": "Bearer \(HelperCommon.apiKey)"]
        request(urlString: urlString, method: HTTPMethod.get, params: params) { (res, isSuccess, _, _) in
            let dict = res as? [String: Any]
            completion(dict, isSuccess)
        }
    }
}
extension SCNetworkManager{
    func getClanData(tag: String, completion:@escaping (_ dict: [String: Any]?,_ isSuccess: Bool)->()){
        let urlString = "https://api.clashroyale.com/v1/clans/\((tag as NSString).replacingOccurrences(of: "#", with: "%23"))"
        let params = ["authorization": "Bearer \(HelperCommon.apiKey)"]
        request(urlString: urlString, method: HTTPMethod.get, params: params) { (res, isSuccess, _, _) in
        let dict = res as? [String: Any]
        completion(dict, isSuccess)
        }
    }
}
extension SCNetworkManager{
    func getClanPastWarsData(tag: String, completion:@escaping (_ dict: [String: Any]?,_ isSuccess: Bool)->()){
        let urlString = "https://api.clashroyale.com/v1/clans/\((tag as NSString).replacingOccurrences(of: "#", with: "%23"))/warlog"
        let params = ["authorization": "Bearer \(HelperCommon.apiKey)"]
        request(urlString: urlString, method: HTTPMethod.get, params: params) { (res, isSuccess, _, _) in
            let dict = res as? [String: Any]
            completion(dict, isSuccess)
        }
    }
}
extension SCNetworkManager{
    func getClanWarsData(tag: String, completion:@escaping (_ dict: [String: Any]?,_ isSuccess: Bool)->()){
        let urlString = "https://api.clashroyale.com/v1/clans/\((tag as NSString).replacingOccurrences(of: "#", with: "%23"))/currentwar"
        let params = ["authorization": "Bearer \(HelperCommon.apiKey)"]
        request(urlString: urlString, method: HTTPMethod.get, params: params) { (res, isSuccess, _, _) in
            let dict = res as? [String: Any]
            completion(dict, isSuccess)
        }
    }
}
