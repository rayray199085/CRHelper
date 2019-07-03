//
//  SCUserAccount.swift
//  WowLittleHelper
//
//  Created by Stephen Cao on 16/5/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import UIKit
import YYModel

private let fileName = "userAccount.json"
class SCUserAccount: NSObject {
    @objc var access_token: String?
    @objc var expires_in: TimeInterval = 0{
        didSet{
            expiresDate = Date(timeIntervalSinceNow: expires_in)
        }
    }
    @objc var expiresDate: Date?
    
    override init() {
        super.init()
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: NSString.getDocumentDirectory().appendingPathComponent(fileName))),
            let dict = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
                return
        }
        yy_modelSet(with: dict)
        if expiresDate?.compare(Date()) != ComparisonResult.orderedDescending{
            try? FileManager.default.removeItem(atPath: NSString.getDocumentDirectory().appendingPathComponent(fileName))
            access_token = nil
            expiresDate = nil
        }
    }
    func saveUserInfo(){
        var dict = yy_modelToJSONObject() as? [String: Any]
        dict?.removeValue(forKey: "expires_in")
        guard let data = try? JSONSerialization.data(withJSONObject: dict ?? [:], options: [])else {
            return
        }
        try? data.write(to: URL(fileURLWithPath: NSString.getDocumentDirectory().appendingPathComponent(fileName)))
    }
}
