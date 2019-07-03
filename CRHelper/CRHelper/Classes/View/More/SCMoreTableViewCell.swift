//
//  SCMoreTableViewCell.swift
//  CardsHelper
//
//  Created by Stephen Cao on 25/6/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

class SCMoreTableViewCell: UITableViewCell {
    var content: [String: String]?{
        didSet{
            guard let imageName = content?["iconName"],
            let titleName = content?["title"],
                let contentText = content?["content"] else{
                    return 
            }
            iconImageView.image = UIImage(named: imageName)
            titleNameLabel.text = titleName
            titleContentLabel.text = contentText
        }
    }
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var titleNameLabel: UILabel!
    @IBOutlet weak var titleContentLabel: UILabel!
}
