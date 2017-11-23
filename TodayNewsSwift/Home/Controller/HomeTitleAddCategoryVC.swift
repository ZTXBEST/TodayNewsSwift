//
//  HomeTitleAddCategoryVC.swift
//  TodayNewsSwift
//
//  Created by 赵天旭 on 2017/11/14.
//  Copyright © 2017年 ZTX. All rights reserved.
//

import UIKit
import IBAnimatable

class HomeTitleAddCategoryVC: AnimatableModalViewController  {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.red
        initTopView()
        initCollectionView()
    }
}

extension HomeTitleAddCategoryVC {
    fileprivate func initTopView() {
        let topView = UIView(frame: CGRect(x: 0, y: 20, width: KScreenWidth, height: 44))
        topView.backgroundColor = UIColor.white
        self.view.addSubview(topView)
        
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30);
        button.x = 10
        button.centerY = topView.height/2
        button.setImage(UIImage(named: "titlebar_close_24x24_"), for: .normal)
        topView.addSubview(button)
        button.addTarget(self, action: #selector(closeBtnClick), for: .touchUpInside)
    }
    
    fileprivate func initCollectionView() {
        
    }
}

extension HomeTitleAddCategoryVC {
    @objc fileprivate func closeBtnClick() {
        dismiss(animated: true, completion: nil)
    }
}
