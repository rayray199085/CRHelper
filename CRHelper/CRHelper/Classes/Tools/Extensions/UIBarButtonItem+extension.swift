//
//  UIBarButtonItem+extension.swift
//  MySinaWeibo
//
//  Created by Stephen Cao on 21/3/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
    /// init barButtonItem with font size and title
    convenience init(title: String, fontSize: CGFloat = 16, target: Any?, action: Selector, isBack :Bool = false){
        let button = UIButton.textButton(withTitle: title, andWithFontSize: fontSize, andWithNormalColor: UIColor.darkGray, andWithHighlight: HelperCommon.govGreenColor)
        button.addTarget(target, action: action, for: .touchUpInside)
        if isBack{
            button.imageButton(withNormalImageName: "navigationbar_back_withtext", andWithHighlightedImageName: "navigationbar_back_withtext_highlighted")
        }
        self.init(customView: button)
    }
    convenience init(normalImageName: String, highlightedImageName: String,target: Any?, action: Selector){
        let button = UIButton.imageButton(withNormalImageName: normalImageName, andWithHighlightedImageName: highlightedImageName)
        button.addTarget(target, action: action, for: UIControl.Event.touchUpInside)
        self.init(customView: button)
    }
}
