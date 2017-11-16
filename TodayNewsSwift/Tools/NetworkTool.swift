//
//  NetworkTool.swift
//  DanTangSwift
//
//  Created by 赵天旭 on 2017/7/5.
//  Copyright © 2017年 ZTX. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SVProgressHUD

//重新封装网络请求。
typealias NetworkFinished = (_ success :Bool, _ result:[String : Any]?, _ error:NSError?) -> ()

extension NetworkTool {
    /// get
    ///
    /// - Parameters:
    ///   - url: urlString
    ///   - params: 参数
    ///   - finished: 完成回调
    func get(url:String, params:[String : Any], finished:@escaping NetworkFinished) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        SVProgressHUD.show(withStatus: "正在加载中")
        Alamofire
            .request(url, method: .get, parameters: params, headers: nil).responseJSON {[weak self] (response) in
                print("url:",response.response?.url as Any,"\n",response.result.value as Any)
                self?.handle(response: response, finished: finished)
        }
    }
    
    /// post
    ///
    /// - Parameters:
    ///   - url: urlString
    ///   - params: 参数
    ///   - finished: 完成回调
    func post(url:String, params:[String : Any], finished:@escaping NetworkFinished) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        SVProgressHUD.show(withStatus: "正在加载中")
        Alamofire
            .request(url, method: .post, parameters: params, headers: nil).responseJSON {[weak self] (response) in
                print("url:",response.response?.url as Any,"\n",response.result.value as Any)
                self?.handle(response: response, finished: finished)
        }
    }
    
    /// 处理响应结果
    ///   - response: 响应对象
    ///   - finished: 完成回调
    fileprivate func handle(response :DataResponse<Any>,finished:@escaping NetworkFinished) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        switch response.result
        {
            
        case .success(let value):
            let json = JSON(value)
            let dict = json["data"].dictionaryObject
            SVProgressHUD.dismiss()
            finished(true, dict, nil)
            break
            
        case .failure(let error):
            SVProgressHUD.showError(withStatus: "请求失败，请重试")
            finished(false,nil,error as NSError?)
            break
            
        }
    }
}

    class NetworkTool: NSObject {
        ///swift 单行单例
        static let shared = NetworkTool()

}
