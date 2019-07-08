//
//  SCLocationsPlayerRankingsController.swift
//  CRHelper
//
//  Created by Stephen Cao on 8/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit
import SVProgressHUD
private let reuseIdentifier = "player_rankings_cell"
class SCLocationsPlayerRankingsController: UIViewController {
    var viewModel: SCLocationsViewModel?{
        didSet{
            if viewModel?.playerRankingsData != nil{
                tableView.scroll(to: UITableView.scrollsTo.top, animated: true)
                return
            }
            SVProgressHUD.show()
            viewModel?.loadLocationPlayerRankings(locationId: viewModel?.locationId, completion: { [weak self](isSuccess) in
                self?.tableView.reloadData()
                self?.tableView.scroll(to: UITableView.scrollsTo.top, animated: true)
                SVProgressHUD.dismiss()
            })
        }
    }
    deinit {
        viewModel?.playerRankingsData = nil
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
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 50
        tableView.register(UINib(nibName: "SCLocationsPlayerRankingsCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
    }
}
extension SCLocationsPlayerRankingsController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let playerCount =  viewModel?.playerRankingsData?.items?.count ?? 0
        tableView.hideSeparatorWhenEmpty(count: playerCount)
        return playerCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SCLocationsPlayerRankingsCell
        cell.item = viewModel?.playerRankingsData?.items?[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showPlayerInfo(tag: viewModel?.playerRankingsData?.items?[indexPath.row].tag)
    }
}
