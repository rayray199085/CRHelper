//
//  SCCardsDisplayView.swift
//  CRHelper
//
//  Created by Stephen Cao on 3/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit
import SVProgressHUD

protocol SCCardsDisplayViewDelegate: NSObjectProtocol {
    func didSelectCell(view: SCCardsDisplayView, index: Int)
}

private let reuseIdentifier = "cards_cell"
class SCCardsDisplayView: UIView {
    var viewModel: SCCardsViewModel?
    weak var delegate: SCCardsDisplayViewDelegate?
    
    class func displayView()->SCCardsDisplayView{
        let nib = UINib(nibName: "SCCardsDisplayView", bundle: nil)
        let v = nib.instantiate(withOwner: self, options: nil)[0] as! SCCardsDisplayView
        v.frame = UIScreen.main.bounds
        return v
    }
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
}
private extension SCCardsDisplayView{
    func setupUI(){
        setupCollectionView()
    }
    func setupCollectionView(){
        collectionView.contentInsetAdjustmentBehavior = .always
        collectionView.register(UINib(nibName: "SCCardsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}
extension SCCardsDisplayView: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.cardData?.items?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SCCardsCollectionViewCell
        cell.cardDataItem = viewModel?.cardData?.items?[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectCell(view: self, index: indexPath.item)
    }
}
