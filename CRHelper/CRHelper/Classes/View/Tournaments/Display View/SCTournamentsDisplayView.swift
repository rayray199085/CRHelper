//
//  SCTournamentsDisplayView.swift
//  CRHelper
//
//  Created by Stephen Cao on 4/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit
protocol SCTournamentsDisplayViewDelegate: NSObjectProtocol {
    func didPressSearchButton(view: SCTournamentsDisplayView, textContent: String?)
    func didSelectedCell(view: SCTournamentsDisplayView, index: Int)
}

private let reuseIdentifier = "tournament_cell"
class SCTournamentsDisplayView: UIView {
    var viewModel: SCTournamentsViewModel?
    
    weak var delegate: SCTournamentsDisplayViewDelegate?
    
    class func displayView()->SCTournamentsDisplayView{
        let nib = UINib(nibName: "SCTournamentsDisplayView", bundle: nil)
        let v = nib.instantiate(withOwner: self, options: nil)[0] as! SCTournamentsDisplayView
        v.frame = UIScreen.main.bounds
        v.searchView.isHidden = true
        return v
    }
    @IBOutlet weak var tableViewTopCons: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        textField.delegate = self
        textField.returnKeyType = .search
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "SCTournamentTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var searchView: UIView!
}
extension SCTournamentsDisplayView: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        delegate?.didPressSearchButton(view: self, textContent: textField.text)
        return false
    }
}
extension SCTournamentsDisplayView: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let itemCount = viewModel?.tournamentsData?.items?.count ?? 0
        tableView.separatorStyle = itemCount > 0 ? UITableViewCell.SeparatorStyle.singleLine : .none
        return itemCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SCTournamentTableViewCell
        cell.dataItem = viewModel?.tournamentsData?.items?[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel?.tournamentsData?.items?[indexPath.row].rowHeight ?? 180
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectedCell(view: self, index: indexPath.row)
    }
}
