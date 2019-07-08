//
//  SCLocationsClanRankingsController.swift
//  CRHelper
//
//  Created by Stephen Cao on 8/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit
import SVProgressHUD

private let reuseIdentifier = "clan_rankings_cell"
class SCLocationsClanRankingsController: UIViewController {
    var viewModel: SCLocationsViewModel?{
        didSet{
            if viewModel?.clanRankingsData != nil {
                tableView.scroll(to: UITableView.scrollsTo.top, animated: true)
                return
            }
            SVProgressHUD.show()
            viewModel?.loadLocationClanRankings(locationId: viewModel?.locationId, completion: { [weak self](isSuccess) in
                self?.tableView.reloadData()
                self?.tableView.scroll(to: UITableView.scrollsTo.top, animated: true)
                SVProgressHUD.dismiss()
            })
        }
    }
    deinit {
        viewModel?.clanRankingsData = nil
    }
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "SCLocationsClanRankingsCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 50
    }
    private func showClanInfo(tag: String?){
        let vc = SCClanDetailsViewController()
        vc.title = tag
        vc.viewModel = viewModel
        SVProgressHUD.show()
        viewModel?.loadClanData(clanTag: tag, completion: { [weak self] (isSuccess) in
            self?.navigationController?.pushViewController(vc, animated: true)
            SVProgressHUD.dismiss()
        })
    }
}
extension SCLocationsClanRankingsController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let clanCount = viewModel?.clanRankingsData?.items?.count ?? 0
        tableView.hideSeparatorWhenEmpty(count: clanCount)
        return clanCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SCLocationsClanRankingsCell
        cell.clanRankingItem = viewModel?.clanRankingsData?.items?[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showClanInfo(tag: viewModel?.clanRankingsData?.items?[indexPath.row].tag)
    }
}
