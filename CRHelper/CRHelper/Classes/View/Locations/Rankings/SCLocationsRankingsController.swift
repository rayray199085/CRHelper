//
//  SCLocationsRankingsController.swift
//  CRHelper
//
//  Created by Stephen Cao on 8/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit
import DLSlideView
import SVProgressHUD

class SCLocationsRankingsController: UIViewController {
    @IBOutlet weak var tabedSlideView: DLTabedSlideView!
    private let clanRankingsController = SCLocationsClanRankingsController()
    private let playerRankingsController = SCLocationsPlayerRankingsController()
    var viewModel: SCLocationsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
}
private extension SCLocationsRankingsController{
    func setupUI(){
        setupTabedSlideView()
        title = "Rankings"
    }
    func setupTabedSlideView(){
        tabedSlideView.baseViewController = self
        tabedSlideView.delegate = self
        tabedSlideView.tabItemNormalColor = UIColor.darkGray
        tabedSlideView.tabItemSelectedColor = HelperCommon.barColor
        tabedSlideView.tabbarTrackColor = HelperCommon.barColor
        tabedSlideView.tabbarBottomSpacing = 3.0
        
        let clanRankingsImage = UIImage(named: "details")?.modifyImageSize(size: CGSize(width: 25, height: 25), backgroundColor:UIColor.white)
        
        let playerRankingsImage = UIImage(named: "member")?.modifyImageSize(size: CGSize(width: 25, height: 25), backgroundColor:UIColor.white)
        
        guard let clanRankingsTab = DLTabedbarItem(title: "Clan", image: clanRankingsImage, selectedImage: clanRankingsImage) else{
            return
        }
        guard let playerRankingsTab = DLTabedbarItem(title: "Player", image: playerRankingsImage, selectedImage: playerRankingsImage) else{
            return
        }
        
        tabedSlideView.tabbarItems = [clanRankingsTab,playerRankingsTab]
        tabedSlideView.buildTabbar()
        tabedSlideView.selectedIndex = 0
    }
}
extension SCLocationsRankingsController: DLTabedSlideViewDelegate{
    func numberOfTabs(in sender: DLTabedSlideView!) -> Int {
        return 2
    }

    func dlTabedSlideView(_ sender: DLTabedSlideView!, controllerAt index: Int) -> UIViewController? {
        switch index {
        case 0:
            return clanRankingsController
        case 1:
            return playerRankingsController
        default:
            return nil
        }
    }
    func dlTabedSlideView(_ sender: DLTabedSlideView!, didSelectedAt index: Int) {
        switch index {
        case 0:
            clanRankingsController.viewModel = viewModel
        case 1:
            playerRankingsController.viewModel = viewModel
        default:
            break
        }
    }
}
