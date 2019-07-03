//
//  UIViewController+extension.swift
//  SCWeiboAssistant
//
//  Created by Stephen Cao on 10/5/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import Foundation

extension UIViewController{
    
    /// add notification to detect keyboard frame chage
    ///
    /// - Parameter selector: selector
    func addKeyboardWillChangeFrameNotification(selector: Selector){
        NotificationCenter.default.addObserver(
            self,
            selector: selector,
            name: UIApplication.keyboardWillChangeFrameNotification,
            object: nil)
    }
    
    /// remove keyboard frame change notification
    func removeKeyboardWillChangeFrameNotification(){
        NotificationCenter.default.removeObserver(
            self,
            name: UIApplication.keyboardWillChangeFrameNotification,
            object: nil)
    }
    
    
    /// get keyboard height and animation duration
    ///
    /// - Parameter notification: notification from selector method
    /// - Returns: height, duration
    func getKeyboardHeightAndAnimationDuration(notification: Notification)->(height:CGFloat, duration: TimeInterval)?{
        guard let keyboardFrame = (notification.userInfo?["UIKeyboardBoundsUserInfoKey"] as? NSValue)?.cgRectValue,
            let duration = (notification.userInfo?["UIKeyboardAnimationDurationUserInfoKey"] as? NSNumber)?.doubleValue else {
                return nil
        }
        return (keyboardFrame.height,duration)
    }
}
