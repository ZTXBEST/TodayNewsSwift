//
//  HomeTitleAddCategoryVC.swift
//  TodayNewsSwift
//
//  Created by 赵天旭 on 2017/11/14.
//  Copyright © 2017年 ZTX. All rights reserved.
//

import UIKit

class HomeTitleAddCategoryVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        initTopView()
        initCollectionView()
    }

}

extension HomeTitleAddCategoryVC {
    fileprivate func initTopView() {
        let topView = UIView(frame: CGRect(x: 0, y: 0, width: KScreenWidth, height: 44))
        topView.backgroundColor = UIColor.white
        self.view.addSubview(topView)
        
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30);
        button.x = 10
        topView.addSubview(button)
    }
    
    fileprivate func initCollectionView() {
        
    }
}
