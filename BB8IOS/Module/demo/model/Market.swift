//
//  Market.swift
//  BB8IOS
//
//  Created by peak on 2018/5/31.
//  Copyright © 2018年 51bb8. All rights reserved.
//

import Foundation
import HandyJSON

class Market: HandyJSON {
    
    var cnname:String?
    var enname:String?
    var price:Double?
    
//    var arrayStringOptional: Array<String>?
//    var setInt: Set<Int>?
//    var dictAnyObject: Dictionary<String, Any> = [:]
    
    var symbol:Symbol=Symbol()
    
    var hour24:Array<TrendPriceTime>?
    
    required init() {
        
    }
}
