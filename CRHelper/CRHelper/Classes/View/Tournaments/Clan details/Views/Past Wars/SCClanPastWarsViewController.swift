//
//  SCClanPastWarsViewController.swift
//  CRHelper
//
//  Created by Stephen Cao on 7/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit
import SVProgressHUD

private let reuseIdentifier = "past_wars_cell"
class SCClanPastWarsViewController: UIViewController {
    private let participantsView = SCClanPastWarsParticipantsView.participantsView()
    
    var viewModel: SCBaseViewModel?{
        didSet{
            if viewModel?.pastWarsData != nil{
                return
            }
            SVProgressHUD.show()
            viewModel?.loadClanPastWarsData(completion: { [weak self](isSuccess) in
                self?.tableView.reloadData()
                SVProgressHUD.dismiss()
            })
        }
    }
    
    deinit {
        viewModel?.pastWarsData = nil
    }
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}
private extension SCClanPastWarsViewController{
    func setupUI(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 272
        tableView.register(UINib(nibName: "SCClanPastWarsCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
        tableView.separatorStyle = .none
        
        navigationController?.view.addSubview(participantsView)
        participantsView.isHidden = true
    }
}
extension SCClanPastWarsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.pastWarsData?.items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SCClanPastWarsCell
        cell.pastWarsItem = viewModel?.pastWarsData?.items?[indexPath.row]
        cell.delegate = self
        return cell
    }
}
extension SCClanPastWarsViewController:SCClanPastWarsCellDelegate{
    func didClickCellInfoButton(view: SCClanPastWarsCell, participants: [SCClanPastWarsParticipant]?) {
        participantsView.participants = participants
        participantsView.isHidden = false
    }
}
