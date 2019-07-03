//
//  UITableView+extension.swift
//  SCWeiboAssistant
//
//  Created by Stephen Cao on 1/5/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import Foundation

extension UITableViewCell{
    func improvePerformance(){
        layer.drawsAsynchronously = true
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
}
