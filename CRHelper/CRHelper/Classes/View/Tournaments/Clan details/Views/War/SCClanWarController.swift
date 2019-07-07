//
//  SCClanWarController.swift
//  CRHelper
//
//  Created by Stephen Cao on 7/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit
import SVProgressHUD

private let reuseIdentifier = "war_cell"
class SCClanWarController: UIViewController {
    var viewModel: SCBaseViewModel?{
        didSet{
            if viewModel?.warData != nil{
                tableView.scroll(to: UITableView.scrollsTo.top, animated: true)
                return
            }
            SVProgressHUD.show()
            viewModel?.loadClanWarData(completion: { [weak self](isSuccess) in
                SVProgressHUD.dismiss()
                self?.stateLabel.text  = self?.viewModel?.warData?.state
                self?.participantCountLabel.text  = "Participating: \(self?.viewModel?.warData?.participants?.count ?? 0)"
                self?.dateLabel.text = self?.viewModel?.warData?.endTimeString
                self?.tableView.reloadData()
                self?.tableView.scroll(to: UITableView.scrollsTo.top, animated: true)
            })
        }
    }
    deinit {
        viewModel?.warData = nil
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var participantCountLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "SCClanPastWarsParticipantsCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 55
    }
}
extension SCClanWarController:UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let participantCount = viewModel?.warData?.participants?.count ?? 0
        tableView.hideSeparatorWhenEmpty(count: participantCount)
        return participantCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SCClanPastWarsParticipantsCell
        cell.participant = viewModel?.warData?.participants?[indexPath.row]
        return cell
    }
}
