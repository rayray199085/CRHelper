//
//  SCPlayerDeckViewController.swift
//  CRHelper
//
//  Created by Stephen Cao on 5/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit
import SVProgressHUD

class SCPlayerDeckViewController: UIViewController {
    var viewModel: SCTournamentsViewModel?{
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
private extension SCPlayerDeckViewController{
    func setupUI(){
        displayView.delegate = self
        view.addSubview(displayView)
        navigationController?.view.addSubview(cardsMaskView)
        cardsMaskView.isHidden = true
    }
    func loadData(){
        if viewModel?.deckDataItems != nil{
            return
        }
        SVProgressHUD.show()
        viewModel?.loadDeckData { [weak self](isSuccess) in
            self?.displayView.cardDataItems = self?.viewModel?.deckDataItems
            self?.displayView.collectionView.reloadData()
            SVProgressHUD.dismiss()
        }
    }
}
extension SCPlayerDeckViewController: SCCardsDisplayViewDelegate{
    func didSelectCell(view: SCCardsDisplayView, index: Int) {
        cardsMaskView.isHidden = false
        cardsMaskView.dataItem = viewModel?.deckDataItems?[index]
        cardsMaskView.displayContentView()
    }
}
