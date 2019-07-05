//
//  SCPlayerChestController.swift
//  CRHelper
//
//  Created by Stephen Cao on 5/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit
import SVProgressHUD

private let reuseIdentifier = "chest_cell"
class SCPlayerChestView: UIView {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: SCTournamentsViewModel?
        
    class func chestView()->SCPlayerChestView{
        let nib = UINib(nibName: "SCPlayerChestView", bundle: nil)
        let v = nib.instantiate(withOwner: self, options: nil)[0] as! SCPlayerChestView
        v.frame = UIScreen.main.bounds
        return v
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "SCPlayerChestCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 56
        
    }
}

extension SCPlayerChestView:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let chestCount = viewModel?.chestData?.items?.count ?? 0
        tableView.separatorStyle = chestCount > 0 ? UITableViewCell.SeparatorStyle.singleLine : .none
        return chestCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SCPlayerChestCell
        cell.chest = viewModel?.chestData?.items?[indexPath.row]
        return cell
    }
}
