//
//  SCTournamentsDetailsController.swift
//  CRHelper
//
//  Created by Stephen Cao on 4/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit
import SVProgressHUD

private let reuseIdentifier = "player_cell"
class SCTournamentsDetailsController: UIViewController {
    var viewModel: SCTournamentsViewModel?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var creatorButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()
    }
    
    @IBAction func clickCreatorButton(_ sender: Any) {
        showPlayerInfo(tag: viewModel?.detailsData?.creatorTag)
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
    
    func showClanInfo(tag: String?){
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
private extension SCTournamentsDetailsController{
    func setupUI(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "SCTournamentPlayerCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 75
    }
    
    func loadData(){
        SVProgressHUD.show()
        viewModel?.loadTournamentsDetailsData(tag: title, completion: { [weak self](isSuccess) in
            self?.tableView.reloadData()
            self?.creatorButton.setTitle(self?.viewModel?.detailsData?.creatorTag, for: [])
            SVProgressHUD.dismiss()
        })
    }
}
extension SCTournamentsDetailsController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let playerCount = viewModel?.detailsData?.membersList?.count ?? 0
        tableView.hideSeparatorWhenEmpty(count: playerCount)
        return playerCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SCTournamentPlayerCell
        cell.member = viewModel?.detailsData?.membersList?[indexPath.row]
        cell.delegate = self
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showPlayerInfo(tag: viewModel?.detailsData?.membersList?[indexPath.row].tag)
    }
}
extension SCTournamentsDetailsController: SCTournamentPlayerCellDelegate{
    func didClickClanButton(view: SCTournamentPlayerCell, clanTag: String?) {
        SVProgressHUD.show()
        viewModel?.loadClanData(clanTag: clanTag, completion: { [weak self](isSuccess) in
            self?.showClanInfo(tag: clanTag)
            SVProgressHUD.dismiss()
        })
    }
}
