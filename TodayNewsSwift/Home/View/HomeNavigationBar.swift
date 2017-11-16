//
//  HomeNavigationBar.swift
//  TodayNewsSwift
//
//  Created by 赵天旭 on 2017/11/6.
//  Copyright © 2017年 ZTX. All rights reserved.
//

import UIKit

class HomeNavigationBar: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleImageView)
        addSubview(searchBar)
        
        titleImageView.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(15)
            make.centerY.equalTo(self).offset(10)
            make.size.equalTo(CGSize(width: 72, height: 20))
        }
        
        searchBar.snp.makeConstraints { (make) in
            make.left.equalTo(titleImageView.snp.right).offset(kMargin)
            make.right.equalTo(self).offset(-15)
            make.centerY.equalTo(self).offset(10)
            make.height.equalTo(30)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate lazy var titleImageView : UIImageView = {
        let titleImageView =  UIImageView(image: UIImage(named: UserDefaults.standard.bool(forKey: isNight) ? "title_night_72x20_" : "title_72x20_"))
        titleImageView.contentMode = .scaleAspectFill
        return titleImageView
    }()
    
    lazy var searchBar : HomeSearchBar = {
        let searchBar = HomeSearchBar.searchBar()
        searchBar.placeholder = "搜你想搜的"
        searchBar.background = UIImage(named: "searchbox_search_20x28_")
        return searchBar
    }()
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
