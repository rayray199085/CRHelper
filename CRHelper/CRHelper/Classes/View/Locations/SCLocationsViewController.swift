//
//  SCLocationsViewController.swift
//  AirQualityAssistant
//
//  Created by Stephen Cao on 2/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit
import SVProgressHUD

class SCLocationsViewController: UIViewController {
    private let locationsListView = SCLocationsListView.listView()
    private let viewModel = SCLocationsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()
    }
}
extension SCLocationsViewController{
    func setupUI(){
        view.addSubview(locationsListView)
        locationsListView.viewModel = viewModel
        locationsListView.delegate = self
    }
    func loadData(){
        SVProgressHUD.show()
        viewModel.loadLocationsList { [weak self](isSuccess) in
            self?.locationsListView.tableView.reloadData()
            if let nameList = self?.viewModel.locationsNameList {
                self?.locationsListView.sctbindex.setView(nameList)
            }
            SVProgressHUD.dismiss()
        }
    }
}
extension SCLocationsViewController: SCLocationsListViewDelegate{
    func didSelectRow(view: SCLocationsListView, locationId: String?) {
        let vc = SCLocationsRankingsController()
        viewModel.locationId = locationId
        vc.viewModel = viewModel
        navigationController?.pushViewController(vc, animated: true)
    }
}
