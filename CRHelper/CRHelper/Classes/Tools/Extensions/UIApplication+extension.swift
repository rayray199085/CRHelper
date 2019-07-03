//
//  UIApplication+extension.swift
//  SCWeiboAssistant
//
//  Created by Stephen Cao on 22/4/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import Foundation
import UserNotifications

extension UIApplication{
    func requestAuthorization(completion:@escaping (_ isSuccess: Bool)->()) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge,.carPlay,.sound]) { (isSuccess, error) in
            completion(isSuccess)
        }
    }
}

