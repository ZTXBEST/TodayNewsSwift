//
//  TXConst.swift
//  DanTangSwift
//
//  Created by 赵天旭 on 2017/7/5.
//  Copyright © 2017年 ZTX. All rights reserved.
//

import UIKit

/// 屏幕的宽
let KScreenWidth = UIScreen.main.bounds.size.width
/// 屏幕的高
let KScreenHeight = UIScreen.main.bounds.size.height

let BASE_URL = "https://is.snssdk.com/"
/// iid 未登录用户 id，只要安装了今日头条就会生成一个 iid
/// 可以在自己的手机上安装一个今日头条，然后通过 charles 抓取一下这个 iid，
/// 替换成自己的，再进行测试
let IID: String = "5034850950"
/// iid 和 device_id 好像是绑定到一起的，不对应的话获取不到数据
let device_id: String = "6096495334"

let app_name = "news_article"

let channel = "App%20Store"

let device_platform = "iphone"

let isNight = "isNight"

/// 间距
let kMargin: CGFloat = 10.0
/// 导航栏高度
let kNavBarHeight: CGFloat = 64.0

func TXColor(r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat) -> UIColor {
//    return UIColor(red:r/255.0,green:g/255.0,blue:b/255.0,alpha:a);
    return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a);
}

/// 背景灰色 f8f9f7
func globalBackgroundColor() -> UIColor {
    return TXColor(r: 248, g: 249, b: 247, a: 1)
}

/// 标题红色
func globalRedColor() -> UIColor {
    return TXColor(r: 210, g: 63, b: 66, a: 1)
}

/// 随机颜色
func randomColor() -> UIColor {
    return TXColor(r: CGFloat(arc4random_uniform(256)), g: CGFloat(arc4random_uniform(256)), b: CGFloat(arc4random_uniform(256)),a: 1)
}

