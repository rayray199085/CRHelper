//
//  SCLocationsListView.swift
//  CRHelper
//
//  Created by Stephen Cao on 8/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit
import SCTableIndex

protocol SCLocationsListViewDelegate: NSObjectProtocol {
    func didSelectRow(view: SCLocationsListView, locationId: String?)
}
private let reuseIdentifier = "locations_cell"
class SCLocationsListView: UIView {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sctbindex: SCTableIndex!
    weak var delegate: SCLocationsListViewDelegate?
    
    var viewModel: SCLocationsViewModel?
    
    class func listView()->SCLocationsListView{
        let nib = UINib(nibName: "SCLocationsListView", bundle: nil)
        let v = nib.instantiate(withOwner: self, options: nil)[0] as! SCLocationsListView
        v.frame = UIScreen.main.bounds
        return v
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "SCLocationsListCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 30
        tableView.separatorStyle = .none
        
        sctbindex.delegate = self
        sctbindex.initialFont = UIFont.boldSystemFont(ofSize: 13)
        sctbindex.initialTextColor = HelperCommon.barColor
    }
}
extension SCLocationsListView: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.locationsData?.items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SCLocationsListCell
        cell.locationNameLabel.text = viewModel?.locationsData?.items?[indexPath.row].name
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectRow(view: self, locationId: viewModel?.locationsData?.items?[indexPath.row].id)
    }
}
extension SCLocationsListView: SCTableIndexDelegate{
    func scTableIndexReturnInitialText(_ strInitial: String, index: Int) {
        tableView.scrollToRow(at: IndexPath(row: index, section: 0), at: .top, animated: true)
    }
}
