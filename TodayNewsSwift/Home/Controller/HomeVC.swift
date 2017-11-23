//
//  HomeVC.swift
//  TodayNewsSwift
//
//  Created by 赵天旭 on 2017/11/2.
//  Copyright © 2017年 ZTX. All rights reserved.
//

import UIKit
import HandyJSON
import SnapKit
import SwiftTheme

class HomeVC: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
//        navigationController?.navigationBar.theme_barTintColor = "colors.homeNavBarTintColor"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = globalBackgroundColor()
        requestData()
        initNavagationBar()
        initUI()
    }
    
    /// 自定义导航栏
    func initNavagationBar() {
        navigationController?.navigationBar.barStyle = .black
        navigationController?.isNavigationBarHidden = true
        self.view.addSubview(homeNavgationBar)
    }

    func requestData() {
        /// 获取标题数据
        let url = BASE_URL + "article/category/get_subscribed/v1/?"
        let params = ["device_id": device_id,
                      "aid": 13,
                      "iid": IID] as [String : AnyObject]
        NetworkTool.shared.get(url: url, params: params) { (success, result, error) in
            
            let data = HomeTitleModel.deserialize(from: result)
            
            for model in (data?.data)! {
                let vc = HomeTopicVC()
                self.addChildViewController(vc)
            }
            
            self.homePageView.childVCs = self.childViewControllers as? [HomeTopicVC]
            self.homePageView.titles = data?.data
        }
    }
    
    fileprivate lazy var homePageView : HomePageView = {
        let homePageView = HomePageView()
        return homePageView
    }()
    fileprivate lazy var homeNavgationBar : HomeNavigationBar = {
        let homeNavgationBar = HomeNavigationBar()
        homeNavgationBar.frame = CGRect(x: 0, y: 0, width: KScreenWidth, height: 64)
        homeNavgationBar.backgroundColor = UIColor.red
        return homeNavgationBar
    }()
}

extension HomeVC {
    fileprivate func initUI() {
        self.view.addSubview(homePageView)
        homePageView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalTo(view)
            make.top.equalTo(view).offset(kNavBarHeight)
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(homeTitleLabelAddBtnClick(notification:)), name: NSNotification.Name("HomeTitleLabelAddBtnClick"), object: nil)
        
    }
}

extension HomeVC {
    @objc func homeTitleLabelAddBtnClick(notification:Notification) {
        let titles = notification.object as! [HomeTitleModel]
        let homeTitleCategoryVC = HomeTitleAddCategoryVC()
        homeTitleCategoryVC.modalSize = (width: .full, height: .custom(size: Float(KScreenHeight - 20)))
        self.present(homeTitleCategoryVC, animated: true) {
            
        };
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}


