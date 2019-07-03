//
//  UIFont+extension.swift
//  SCExtensionTools
//
//  Created by Stephen Cao on 14/6/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import Foundation
extension UIFont{
    
    /// For adjusting font size
    ///
    /// - Parameters:
    ///   - font: custom font
    ///   - style: text style
    /// - Returns: adjusted font
    static func scaleFont(font: UIFont, style: UIFont.TextStyle)->UIFont{
        let metrics = UIFontMetrics(forTextStyle: style)
        return metrics.scaledFont(for: font)
    }
}
