//
//  SCPlayerCardsViewController.swift
//  CRHelper
//
//  Created by Stephen Cao on 5/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit
import SVProgressHUD

class SCPlayerCardsViewController: UIViewController {
    var viewModel: SCBaseViewModel?{
        didSet{
            loadData()
        }
    }
    private let displayView = SCCardsDisplayView.displayView()
    private let cardsMaskView = SCCardsMaskView.maskView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}
private extension SCPlayerCardsViewController{
    func setupUI(){
        displayView.delegate = self
        view.addSubview(displayView)
        navigationController?.view.addSubview(cardsMaskView)
        cardsMaskView.isHidden = true
    }
    func loadData(){
        if viewModel?.cardDataItems != nil{
            return 
        }
        SVProgressHUD.show()
        viewModel?.loadCardsData { [weak self](isSuccess) in
            self?.displayView.cardDataItems = self?.viewModel?.cardDataItems
            self?.displayView.collectionView.reloadData()
            SVProgressHUD.dismiss()
        }
    }
}
extension SCPlayerCardsViewController: SCCardsDisplayViewDelegate{
    func didSelectCell(view: SCCardsDisplayView, index: Int) {
        cardsMaskView.isHidden = false
        cardsMaskView.dataItem = viewModel?.cardDataItems?[index]
        cardsMaskView.displayContentView()
    }
}
