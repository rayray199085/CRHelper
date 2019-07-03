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
    private let viewModel = SCCardsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()
    }
}
private extension SCCardsViewController{
    func setupUI(){
        displayView.viewModel = viewModel
        view.addSubview(displayView)
    }
    func loadData(){
        SVProgressHUD.show()
        viewModel.loadCardsData { [weak self](isSuccess) in
            self?.displayView.collectionView.reloadData()
            SVProgressHUD.dismiss()
        }
    }

}
