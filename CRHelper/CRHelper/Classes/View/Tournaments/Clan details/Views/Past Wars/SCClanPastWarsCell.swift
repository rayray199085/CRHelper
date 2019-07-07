//
//  SCClanPastWarsCell.swift
//  CRHelper
//
//  Created by Stephen Cao on 7/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit
protocol SCClanPastWarsCellDelegate: NSObjectProtocol {
    func didClickCellInfoButton(view: SCClanPastWarsCell, participants: [SCClanPastWarsParticipant]?)
}
private let reuseId = "standing_cell"
class SCClanPastWarsCell: UITableViewCell {
    weak var delegate: SCClanPastWarsCellDelegate?
    
    var pastWarsItem: SCClanPastWarsItem?{
        didSet{
            seasonLabel.text = "War Season \(pastWarsItem?.seasonId ?? 0)"
            dateLabel.text = pastWarsItem?.createdDateString
            tableView.reloadData()
            tableView.scroll(to: UITableView.scrollsTo.top, animated: true)
        }
    }
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBAction func clickInfoButton(_ sender: Any) {
        delegate?.didClickCellInfoButton(view: self, participants: pastWarsItem?.participants)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "SCClanPastWarsStandingCell", bundle: nil), forCellReuseIdentifier: reuseId)
        tableView.rowHeight = 105
    }
}
extension SCClanPastWarsCell:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let standingCount = pastWarsItem?.standings?.count ?? 0
        tableView.hideSeparatorWhenEmpty(count: standingCount)
        return standingCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath) as! SCClanPastWarsStandingCell
        cell.standing = pastWarsItem?.standings?[indexPath.row]
        return cell
    }
}
