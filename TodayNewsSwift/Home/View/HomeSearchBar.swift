//
//  HomeSearchBar.swift
//  TodayNewsSwift
//
//  Created by 赵天旭 on 2017/11/6.
//  Copyright © 2017年 ZTX. All rights reserved.
//

import UIKit

class HomeSearchBar: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        let icon = UIImageView()
        icon.image = UIImage(named: "searchicon_search_20x20_")
        icon.width = 30
        icon.height = 30
        icon.contentMode = .center
        leftView = icon
        leftViewMode = .always
    }
    
    class func searchBar() -> HomeSearchBar {
        return HomeSearchBar()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
