//
//  SCClanDetailsViewController.swift
//  CRHelper
//
//  Created by Stephen Cao on 6/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit
import SVProgressHUD

private let reuseIdentifier = "member_cell"
class SCClanDetailsViewController: UIViewController {
    var viewModel: SCBaseViewModel?
    
    private let detailsInfoView = SCClanDetailsInfoView.infoView()
    private let tableView = UITableView(frame: UIScreen.main.bounds)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func showPlayerInfo(tag: String?){
        let vc = SCPlayerDetailsViewController()
        vc.title = tag
        vc.viewModel = viewModel
        SVProgressHUD.show()
        viewModel?.loadPlayerData(tag: tag, completion: { [weak self] (isSuccess) in
            self?.navigationController?.pushViewController(vc, animated: true)
            SVProgressHUD.dismiss()
        })
    }
    
    deinit {
        viewModel?.clanData = nil
    }
    
    @objc private func showClanDetails(){
        navigationItem.rightBarButtonItem?.isEnabled = false
        if detailsInfoView.frame.origin.x == UIScreen.screenWidth(){
            detailsInfoView.addPopHorizontalAnimation(fromValue: UIScreen.screenWidth() * 3 / 2, toValue: UIScreen.screenWidth() / 2, springBounciness: 8, springSpeed: 8, delay: 0) { [weak self](_, _) in
                    self?.navigationItem.rightBarButtonItem?.isEnabled = true
                }
        }else{
            detailsInfoView.addPopHorizontalAnimation(fromValue: UIScreen.screenWidth() / 2, toValue: UIScreen.screenWidth() * 3 / 2, springBounciness: 8, springSpeed: 8, delay: 0) { [weak self](_, _) in
                self?.navigationItem.rightBarButtonItem?.isEnabled = true
            }
        }
    }
}
private extension SCClanDetailsViewController{
    func setupUI(){
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 175
        tableView.register(UINib(nibName: "SCClanMemberListCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Clan", fontSize: 16, target: self, action: #selector(showClanDetails), isBack: false)
        
        detailsInfoView.frame.origin.x = UIScreen.screenWidth()
        view.addSubview(detailsInfoView)
        detailsInfoView.viewModel = viewModel
    }
}
extension SCClanDetailsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let memberCount = viewModel?.clanData?.memberList?.count ?? 0
        tableView.hideSeparatorWhenEmpty(count: memberCount)
        return memberCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SCClanMemberListCell
        cell.member = viewModel?.clanData?.memberList?[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showPlayerInfo(tag: viewModel?.clanData?.memberList?[indexPath.row].tag)
    }
}
