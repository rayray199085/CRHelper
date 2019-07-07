//
//  SCClanMemberListController.swift
//  CRHelper
//
//  Created by Stephen Cao on 7/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit
import SVProgressHUD

private let reuseIdentifier = "member_cell"
class SCClanMemberListController: UIViewController {
    var viewModel: SCBaseViewModel?{
        didSet{
            tableView.reloadData()
            tableView.scroll(to: UITableView.scrollsTo.top, animated: true)
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    private func showPlayerInfo(tag: String?){
        let vc = SCPlayerDetailsViewController()
        vc.title = tag
        vc.viewModel = viewModel
        SVProgressHUD.show()
        viewModel?.loadPlayerData(tag: tag, completion: { [weak self] (isSuccess) in
            self?.navigationController?.pushViewController(vc, animated: true)
            SVProgressHUD.dismiss()
        })
    }
}
private extension SCClanMemberListController{
    func setupUI(){
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 175
        tableView.register(UINib(nibName: "SCClanMemberListCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
    }
}
extension SCClanMemberListController: UITableViewDelegate, UITableViewDataSource{
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
