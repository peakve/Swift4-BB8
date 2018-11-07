//
//  KlineResponse.swift
//  BB8IOS
//
//  Created by peak on 2018/6/6.
//  Copyright © 2018年 51bb8. All rights reserved.
//

import Foundation
import HandyJSON

class KlineResponse: HandyJSON {
    
    
     var success:Bool=false
    
     var data :KlineData?
    
    
    
    required init() {}
    
    
}

class KlineData : HandyJSON{
    
    var lines: Array<Array<Double>>?
    
     required init() {}
    
}
