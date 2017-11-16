//
//  TabBarController.swift
//  TodayNewsSwift
//
//  Created by 赵天旭 on 2017/11/2.
//  Copyright © 2017年 ZTX. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tabbar = UITabBar.appearance()
        tabbar.tintColor = TXColor(r: 245, g: 90, b: 93, a: 1)
        addChildViewControllers()
    }
    
    private func addChildViewControllers() {
        addViewController(controller: HomeVC(), title: "首页", imageName: "home_tabbar_32x32_", selectedImage: "home_tabbar_press_32x32_")
        addViewController(controller: VideoVC(), title: "视频", imageName: "video_tabbar_32x32_", selectedImage: "video_tabbar_press_32x32_")
        addViewController(controller: WeitoutiaoVC(), title: "微头条", imageName: "weitoutiao_tabbar_32x32_", selectedImage: "weitoutiao_tabbar_press_32x32_")
        addViewController(controller: MineVC(), title: "未登录", imageName: "no_login_tabbar_32x32_", selectedImage: "no_login_tabbar_press_32x32_")
    }
    
    private func addViewController(controller : UIViewController, title : String, imageName : String, selectedImage : String) {
        controller.tabBarItem.title = title;
        controller.tabBarItem.image = UIImage(named: imageName)
        controller.tabBarItem.selectedImage = UIImage(named: selectedImage)
        
        let nav = NavigationController(rootViewController: controller)
        nav.title = title
        addChildViewController(nav)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
