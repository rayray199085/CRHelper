//
//  SCCardsViewController.swift
//  AirQualityAssistant
//
//  Created by Stephen Cao on 2/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit
import SVProgressHUD

class SCCardsViewController: UIViewController {
    private let displayView = SCCardsDisplayView.displayView()
    private let cardsMaskView = SCCardsMaskView.maskView()
    private let viewModel = SCCardsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()
    }
}
private extension SCCardsViewController{
    func setupUI(){
        
        displayView.delegate = self
        view.addSubview(displayView)
        view.addSubview(cardsMaskView)
        cardsMaskView.isHidden = true
    }
    func loadData(){
        SVProgressHUD.show()
        viewModel.loadCardsData { [weak self](isSuccess) in
            self?.displayView.cardDataItems = self?.viewModel.cardData?.items
            self?.displayView.collectionView.reloadData()
            SVProgressHUD.dismiss()
        }
    }
}
extension SCCardsViewController: SCCardsDisplayViewDelegate{
    func didSelectCell(view: SCCardsDisplayView, index: Int) {
        cardsMaskView.isHidden = false
        cardsMaskView.dataItem = viewModel.cardData?.items?[index]
        cardsMaskView.displayContentView()
    }
}
