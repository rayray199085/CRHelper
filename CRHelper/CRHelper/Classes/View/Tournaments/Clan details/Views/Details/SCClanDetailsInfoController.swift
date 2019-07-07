//
//  SCClanDetailsInfoController.swift
//  CRHelper
//
//  Created by Stephen Cao on 7/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

class SCClanDetailsInfoController: UIViewController {
    private let detailsInfoView = SCClanDetailsInfoView.infoView()
    var viewModel: SCBaseViewModel?{
        didSet{
             detailsInfoView.viewModel = viewModel
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(detailsInfoView)
    }
}
