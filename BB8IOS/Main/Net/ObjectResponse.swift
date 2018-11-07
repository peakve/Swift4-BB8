//
//  ObjectResponse.swift
//  BB8IOS
//
//  Created by peak on 2018/5/31.
//  Copyright © 2018年 51bb8. All rights reserved.
//

import Foundation
import HandyJSON

class ObjectResponse<T: HandyJSON>: HandyJSON {
    
    
    var respond: Response = Response()
    
    var data: T?
    
    required init() {
    }
    
}
