//
//  SCPlayerAchievementsController.swift
//  CRHelper
//
//  Created by Stephen Cao on 5/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit

private let reuseIdentifier = "achieve_cell"
class SCPlayerAchievementsController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: SCTournamentsViewModel?{
        didSet{
            tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "SCPlayerAchievementCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 50
    }
}
extension SCPlayerAchievementsController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.playerData?.achievements?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SCPlayerAchievementCell
        cell.achievement = viewModel?.playerData?.achievements?[indexPath.row]
        return cell
    }
    
}
