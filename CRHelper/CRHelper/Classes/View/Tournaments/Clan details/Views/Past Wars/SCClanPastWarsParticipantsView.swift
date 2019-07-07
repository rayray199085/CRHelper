//
//  SCClanPastWarsParticipantsView.swift
//  CRHelper
//
//  Created by Stephen Cao on 7/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit
private let reuseIdentifier = "participant_cell"
class SCClanPastWarsParticipantsView: UIView {
    var participants: [SCClanPastWarsParticipant]?{
        didSet{
            tableView.reloadData()
            tableView.scroll(to: UITableView.scrollsTo.top, animated: true)
        }
    }
    
    @IBAction func clickMaskView(_ sender: Any) {
        isHidden = true
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    class func participantsView()->SCClanPastWarsParticipantsView{
        let nib = UINib(nibName: "SCClanPastWarsParticipantsView", bundle: nil)
        let v = nib.instantiate(withOwner: self, options: nil)[0] as! SCClanPastWarsParticipantsView
        v.frame = UIScreen.main.bounds
        return v
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "SCClanPastWarsParticipantsCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 55
        tableView.separatorStyle = .none
    }
}
extension SCClanPastWarsParticipantsView:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return participants?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SCClanPastWarsParticipantsCell
        cell.participant = participants?[indexPath.row]
        return cell
    }
}
