//
//  SCClanDetailsViewController.swift
//  CRHelper
//
//  Created by Stephen Cao on 6/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit
import SVProgressHUD
import DLSlideView

class SCClanDetailsViewController: UIViewController {
    var viewModel: SCBaseViewModel?
    @IBOutlet weak var tabedSlideView: DLTabedSlideView!
    private let memberListController = SCClanMemberListController()
    private let detailsInfoController = SCClanDetailsInfoController()
    private let warController = SCClanWarController()
    private let pastWarsController = SCClanPastWarsViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    deinit {
        viewModel?.clanData = nil
    }
}
private extension SCClanDetailsViewController{
    func setupUI(){
        setupTabedSlideView()
    }
    func setupTabedSlideView(){
        tabedSlideView.baseViewController = self
        tabedSlideView.delegate = self
        tabedSlideView.tabItemNormalColor = UIColor.darkGray
        tabedSlideView.tabItemSelectedColor = HelperCommon.barColor
        tabedSlideView.tabbarTrackColor = HelperCommon.barColor
        tabedSlideView.tabbarBottomSpacing = 3.0
        
        let detailsInfoImage = UIImage(named: "details")?.modifyImageSize(size: CGSize(width: 25, height: 25), backgroundColor:UIColor.white)
        
        let memberListImage = UIImage(named: "member")?.modifyImageSize(size: CGSize(width: 25, height: 25), backgroundColor:UIColor.white)
        
        let warImage = UIImage(named: "war")?.modifyImageSize(size: CGSize(width: 25, height: 25), backgroundColor:UIColor.white)
        
        let pastWarsImage = UIImage(named: "past_war")?.modifyImageSize(size: CGSize(width: 25, height: 25), backgroundColor:UIColor.white)
        
        guard let detailsInfoTab = DLTabedbarItem(title: "Details", image: detailsInfoImage, selectedImage: detailsInfoImage) else{
            return
        }
        
        guard let memberListTab = DLTabedbarItem(title: "Member", image: memberListImage, selectedImage: memberListImage) else{
                return
        }
        
        guard let warTab = DLTabedbarItem(title: "War", image: warImage, selectedImage: warImage) else{
            return
        }
        
        guard let pastWarTab = DLTabedbarItem(title: "Past Wars", image: pastWarsImage, selectedImage: pastWarsImage) else{
            return
        }
        
        tabedSlideView.tabbarItems = [detailsInfoTab,memberListTab,warTab,pastWarTab]
        tabedSlideView.buildTabbar()
        tabedSlideView.selectedIndex = 0
    }
}
extension SCClanDetailsViewController: DLTabedSlideViewDelegate{
    func numberOfTabs(in sender: DLTabedSlideView!) -> Int {
        return 4
    }
    
    func dlTabedSlideView(_ sender: DLTabedSlideView!, controllerAt index: Int) -> UIViewController? {
        switch index {
        case 0:
            return detailsInfoController
        case 1:
            return memberListController
        case 2:
            return warController
        case 3:
            return pastWarsController
        default:
            return nil
        }
    }
    func dlTabedSlideView(_ sender: DLTabedSlideView!, didSelectedAt index: Int) {
        switch index {
        case 0:
            detailsInfoController.viewModel = viewModel
        case 1:
            memberListController.viewModel = viewModel
        case 2:
            warController.viewModel = viewModel
        case 3:
            pastWarsController.viewModel = viewModel
        default:
            break
        }
    }
}
