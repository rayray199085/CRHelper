//
//  SCPlayerDetailsViewController.swift
//  CRHelper
//
//  Created by Stephen Cao on 5/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit
import DLSlideView
import SVProgressHUD

class SCPlayerDetailsViewController: UIViewController {
    var viewModel: SCBaseViewModel?
    
    private let statsViewController = UIStoryboard(name: "SCPlayerStatsViewController", bundle: nil).instantiateViewController(withIdentifier: "player_stats") as! SCPlayerStatsViewController
    private let cardsViewController = SCPlayerCardsViewController()
    private let deckViewController = SCPlayerDeckViewController()
    private let achievementsController = SCPlayerAchievementsController()
    private let chestView = SCPlayerChestView.chestView()
    
    @IBOutlet weak var tabedSlideView: DLTabedSlideView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    deinit {
        // avoid loading same data
        viewModel?.resetPlayData()
    }
    
    @objc private func clickChestsButton(){
        navigationItem.rightBarButtonItem?.isEnabled = false
        if viewModel?.chestData != nil{
            showChestView()
            return
        }
        SVProgressHUD.show()
        viewModel?.loadChestData(completion: { [weak self](isSuccess) in
            self?.chestView.tableView.reloadData()
            self?.showChestView()
            SVProgressHUD.dismiss()
        })
    }
    func showChestView(){
        chestView.tableView.scroll(to: UITableView.scrollsTo.top, animated: true)
        chestView.addPopHorizontalAnimation(fromValue: UIScreen.screenWidth() * 3 / 2, toValue: UIScreen.screenWidth() / 2, springBounciness: 8, springSpeed: 8, delay: 0) { [weak self](_, _) in
            self?.navigationItem.rightBarButtonItem?.isEnabled = true
        }
    }
}

private extension SCPlayerDetailsViewController{
    func setupUI(){
        setupTabedSlideView()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Chests", fontSize: 16, target: self, action: #selector(clickChestsButton), isBack: false)
        
        navigationController?.view.addSubview(chestView)
        chestView.delegate = self
        chestView.frame.origin.x = UIScreen.screenWidth()
        chestView.viewModel = viewModel
    }
    func setupTabedSlideView(){
        tabedSlideView.baseViewController = self
        tabedSlideView.delegate = self
        tabedSlideView.tabItemNormalColor = UIColor.darkGray
        tabedSlideView.tabItemSelectedColor = HelperCommon.barColor
        tabedSlideView.tabbarTrackColor = HelperCommon.barColor
        tabedSlideView.tabbarBottomSpacing = 3.0
        
        let statsImage = UIImage(named: "stats")?.modifyImageSize(size: CGSize(width: 25, height: 25), backgroundColor:UIColor.white)
        
        let cardImage = UIImage(named: "cards")?.modifyImageSize(size: CGSize(width: 25, height: 25), backgroundColor:UIColor.white)
        
        let deckImage = UIImage(named: "deck")?.modifyImageSize(size: CGSize(width: 25, height: 25), backgroundColor: UIColor.white)
        
        let achievementsImage = UIImage(named: "achieve")?.modifyImageSize(size: CGSize(width: 25, height: 25), backgroundColor: UIColor.white)
        
        guard let statsTab = DLTabedbarItem(title: "Stats", image: statsImage, selectedImage: statsImage),
            let cardTab = DLTabedbarItem(title: "Cards", image: cardImage, selectedImage: cardImage),
            let deckTab = DLTabedbarItem(title: "Deck", image: deckImage, selectedImage: deckImage),
            let achievementsTab = DLTabedbarItem(title: "Achieve", image: achievementsImage, selectedImage: achievementsImage) else{
                return
        }
        tabedSlideView.tabbarItems = [statsTab,cardTab,deckTab,achievementsTab]
        tabedSlideView.buildTabbar()
        tabedSlideView.selectedIndex = 0
    }
}
extension SCPlayerDetailsViewController: DLTabedSlideViewDelegate{
    func numberOfTabs(in sender: DLTabedSlideView!) -> Int {
        return 4
    }
    
    func dlTabedSlideView(_ sender: DLTabedSlideView!, controllerAt index: Int) -> UIViewController? {
        switch index {
        case 0:
            return statsViewController
        case 1:
            return cardsViewController
        case 2:
            return deckViewController
        case 3:
            return achievementsController
        default:
            return nil
        }
    }
    func dlTabedSlideView(_ sender: DLTabedSlideView!, didSelectedAt index: Int) {
        switch index {
        case 0:
            statsViewController.viewModel = viewModel
        case 1:
            cardsViewController.viewModel = viewModel
        case 2:
            deckViewController.viewModel = viewModel
        case 3:
            achievementsController.viewModel = viewModel
        default:
            break
        }
    }
}
extension SCPlayerDetailsViewController: SCPlayerChestViewDelegate{
    func didClickMaskButton(view: SCPlayerChestView) {
        chestView.addPopHorizontalAnimation(fromValue: UIScreen.screenWidth() / 2, toValue: UIScreen.screenWidth() * 3 / 2, springBounciness: 8, springSpeed: 8, delay: 0, completionBlock: nil)
    }
}
