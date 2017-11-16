//
//  HomeTitleModel.swift
//  TodayNewsSwift
//
//  Created by 赵天旭 on 2017/11/3.
//  Copyright © 2017年 ZTX. All rights reserved.
//

import UIKit
import HandyJSON


class TitleModel: HandyJSON {
    var category : String?
    var concern_id : String?
    var default_add : String?
    var flags : String?
    var name : String?
    var tip_new : String?
    var type : String?
    var web_url : String?
    
    required init () {}
}

class HomeTitleModel: HandyJSON {
    var data : [TitleModel]?
    required init () {}
}
