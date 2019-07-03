//
//  SCNavigationViewController.swift
//  WowLittleHelper
//
//  Created by Stephen Cao on 16/5/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import UIKit

class SCNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        allowSwipeToGoBack()
        navigationBar.barTintColor = HelperCommon.barColor
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: HelperCommon.tinColor, NSAttributedString.Key.font:  UIFont(name: "Supercell-Magic", size: 18)!]
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if children.count > 0{
            viewController.hidesBottomBarWhenPushed = true
            let leftBarButtonItem = children.count == 1 ? (children[0].title ?? "Back") : "Back"
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(
                title: leftBarButtonItem,
                fontSize: 16,
                target: self,
                action: #selector(goBack),
                isBack: true)
        }
        super.pushViewController(viewController, animated: animated)
    }
    @objc private func goBack(){
        popViewController(animated: true)
    }
}
