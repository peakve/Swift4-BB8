//
//  HSStockBasicInfoModel.swift
//  BB8IOS
//
//  Created by peak on 2018/6/5.
//  Copyright © 2018年 51bb8. All rights reserved.
//

import UIKit
import SwiftyJSON

class HSStockBasicInfoModel: NSObject {

    var stockName: String = ""
    var preClosePrice: CGFloat = 0
    
    class func getStockBasicInfoModel(_ json: JSON) -> HSStockBasicInfoModel {
        let model = HSStockBasicInfoModel()
        model.stockName = json["SZ300033"]["name"].stringValue
        model.preClosePrice = CGFloat(json["SZ300033"]["last_close"].doubleValue)
        
        return model
    }
}
