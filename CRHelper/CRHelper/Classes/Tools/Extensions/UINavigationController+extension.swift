//
//  UINavigationController+extension.swift
//  SCWeiboAssistant
//
//  Created by Stephen Cao on 9/5/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import Foundation

extension UINavigationController{
    
    /// When overriding navigationItem.leftButtonItem, swipe gesture cannot be used
    func allowSwipeToGoBack(){
        interactivePopGestureRecognizer!.delegate = nil
    }
}
