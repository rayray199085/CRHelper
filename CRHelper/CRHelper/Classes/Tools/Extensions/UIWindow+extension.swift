//
//  UIWindow+extension.swift
//  ReflectReview
//
//  Created by Stephen Cao on 16/4/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import UIKit
extension UIWindow{
    
    /// initialise window with controller name
    ///
    /// - Parameter controller: controller name string for reflection
    static func initWindow(controllerName controller: String)->UIWindow{
        let window = UIWindow.init(frame: UIScreen.main.bounds)
        let clsName = controller
        let bundleName = Bundle.main.nameSpace
        let cls = NSClassFromString("\(bundleName)." + clsName) as? UIViewController.Type
        let vc = cls?.init()
        window.rootViewController = vc
        window.makeKeyAndVisible()
        return window
    }
}
