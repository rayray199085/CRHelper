//
//  SCCardsMaskView.swift
//  CRHelper
//
//  Created by Stephen Cao on 4/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

class SCCardsMaskView: UIView {
    var dataItem: SCCardsDataItem?{
        didSet{
            cardImageView.image = dataItem?.iconUrls?.cardImage
            nameLabel.text = dataItem?.name
            maxLevelLabel.text = "\(dataItem?.maxLevel ?? 1)"
           
            countName.isHidden = (dataItem?.count ?? 0) == 0
            countLabel.isHidden = (dataItem?.count ?? 0) == 0
            countLabel.text = "\(dataItem?.count ?? 0)"
            
            levelName.isHidden = (dataItem?.level ?? 0) == 0
            levelLabel.isHidden = (dataItem?.level ?? 0) == 0
            levelLabel.text = "\(dataItem?.level ?? 1)"
        }
    }
    class func maskView()->SCCardsMaskView{
        let nib = UINib(nibName: "SCCardsMaskView", bundle: nil)
        let v = nib.instantiate(withOwner: self, options: nil)[0] as! SCCardsMaskView
        v.frame = UIScreen.main.bounds
        return v
    }
    
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var countName: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var levelName: UILabel!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var maxLevelLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBAction func clickMaskButton(_ sender: Any) {
        contentView.addPopVerticalAnimation(fromValue: UIScreen.main.bounds.height / 2, toValue: -UIScreen.main.bounds.height / 2, springBounciness: 12, springSpeed: 12, delay: 0) { [weak self](_, _) in
            self?.isHidden = true
        }
    }
    
    func displayContentView(){
        contentView.addPopVerticalAnimation(fromValue: -UIScreen.main.bounds.height / 2, toValue: UIScreen.main.bounds.height / 2, springBounciness: 12, springSpeed: 12, delay: 0, completionBlock: nil)
    }
}
