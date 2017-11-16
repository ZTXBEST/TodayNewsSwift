//
//  NavigationController.swift
//  TodayNewsSwift
//
//  Created by 赵天旭 on 2017/11/2.
//  Copyright © 2017年 ZTX. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController ,UIGestureRecognizerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let navBar = UINavigationBar.appearance()
        navBar.barTintColor = UIColor.white
        navBar.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        navBar.titleTextAttributes = [.font : UIFont.systemFont(ofSize: 17.0)]
        
//        创建全局返回手势
        initPan()
    }
    //全局拖拽返回手势
    private func initPan() {
        let target = interactivePopGestureRecognizer?.delegate
        let handler = NSSelectorFromString("handleNavigationTransition:")
        let pan = UIPanGestureRecognizer(target: target, action: handler)
        pan.delegate = self as UIGestureRecognizerDelegate
        self.view.addGestureRecognizer(pan)
//   关闭系统边缘手势
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return self.childViewControllers.count != 1
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
