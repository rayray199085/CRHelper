//
//  SCTournamentsViewController.swift
//  AirQualityAssistant
//
//  Created by Stephen Cao on 2/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit
import SVProgressHUD

class SCTournamentsViewController: UIViewController {
    private let displayView = SCTournamentsDisplayView.displayView()
    private let viewModel = SCTournamentsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    @objc private func clickAddButton(){
        let from = displayView.searchView.isHidden ? 0.0 : 1.0
        let to = displayView.searchView.isHidden ? 1.0 : 0.0
        navigationItem.rightBarButtonItem?.isEnabled = false
        if displayView.searchView.isHidden{
            displayView.searchView.isHidden = false
            displayView.searchView.addPopAlphaAnimation(fromValue: from, toValue: to, duration: 0.5) { [weak self](_, _) in
                self?.navigationItem.rightBarButtonItem?.isEnabled = true
                self?.displayView.textField.becomeFirstResponder()
                self?.displayView.tableViewTopCons.constant = 44
            }
        }else{
            displayView.textField.resignFirstResponder()
            displayView.searchView.addPopAlphaAnimation(fromValue: from, toValue: to, duration: 0.5) { [weak self](_, _) in
                self?.navigationItem.rightBarButtonItem?.isEnabled = true
                self?.displayView.searchView.isHidden = true
                self?.displayView.tableViewTopCons.constant = 0
            }
        }
    }
}
private extension SCTournamentsViewController{
    func setupUI(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.search, target: self, action: #selector(clickAddButton))
        
        view.addSubview(displayView)
        displayView.delegate = self
        displayView.viewModel = viewModel
    }
}
extension SCTournamentsViewController: SCTournamentsDisplayViewDelegate{
    func didSelectedCell(view: SCTournamentsDisplayView, index: Int) {
        let vc = SCTournamentsDetailsController()
        let tag = viewModel.tournamentsData?.items?[index].tag
        SVProgressHUD.show()
        viewModel.loadTournamentsDetailsData(tag: tag) { [weak self](isSuccess) in
            SVProgressHUD.dismiss()
            vc.title = tag
            self?.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func didPressSearchButton(view: SCTournamentsDisplayView, textContent: String?) {
        clickAddButton()
        if textContent != ""{
            SVProgressHUD.show()
            viewModel.loadTournamentsData(name: textContent) { [weak self](isSuccess) in
                self?.displayView.tableView.reloadData()
                self?.displayView.tableView.scroll(to: UITableView.scrollsTo.top, animated: true)
                SVProgressHUD.dismiss()
            }
        }
       
    }
}
