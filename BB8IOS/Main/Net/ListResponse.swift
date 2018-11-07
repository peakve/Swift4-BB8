//
//  ListResponse.swift
//  BB8IOS
//
//  Created by peak on 2018/5/31.
//  Copyright © 2018年 51bb8. All rights reserved.
//

import Foundation
import HandyJSON

class ListResponse<T: HandyJSON>: HandyJSON {
    
    var int: Int?
    var total:Int?
    var size:Int?
    var lastPage:Int?
    var list: Array<T> = []
    
    var respond: Response = Response()
    
    required init() {
    }
    
}
