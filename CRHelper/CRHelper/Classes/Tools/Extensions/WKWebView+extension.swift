//
//  WKWebView+extension.swift
//  SCWeiboAssistant
//
//  Created by Stephen Cao on 23/4/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import Foundation
import WebKit

extension WKWebView{
    func autoFillUsernameAndPassword(username: String, password: String){
        let js = "document.getElementById('userId').value = '\(username)';" +
        "document.getElementById('passwd').value = '\(password)';"
        evaluateJavaScript(js, completionHandler: nil)
    }
}
