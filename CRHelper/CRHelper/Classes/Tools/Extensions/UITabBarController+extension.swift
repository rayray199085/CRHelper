//
//  UITabBarController+extension.swift
//  DiabloAssistant
//
//  Created by Stephen Cao on 23/5/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import Foundation

extension UITabBarController{
    func disableTabBarItem(index: Int){
        if let arrayOfTabBarItems = self.tabBar.items as AnyObject as? NSArray,let
            tabBarItem = arrayOfTabBarItems[index] as? UITabBarItem {
            tabBarItem.isEnabled = false
        }
    }
}
