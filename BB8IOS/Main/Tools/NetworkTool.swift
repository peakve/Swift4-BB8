//
//  NetworkTool.swift
//
//  Created by peak on 2018/5/31.
//  Copyright © 2018年 51bb8. All rights reserved.
//

import Foundation

protocol NetworkToolProtocol {
    // MARK: - --------------------------------- 首页 home  ---------------------------------
    // MARK: 首页数据
    static func loadHomeData(p:Entity,completionHandler: @escaping (_ data: [Entity]) -> ())
    
    // MARK: Kline
    static func getKlineChartData(market:String,symbol: String,quote:String, range: Int, size: Int,completionHandler:@escaping (Bool, [KlineChartData]) -> Void)

}

extension NetworkToolProtocol {
    // MARK: - --------------------------------- 首页 home  ---------------------------------
    ///
    /// - parameter completionHandler: 返回标题数据
    /// - parameter newsTitles: 首页标题数组
    static func loadHomeData(p:Entity,completionHandler: @escaping (_ data: [Entity]) -> ()) {
        let url = "/xxx/xxx/v1/?"
        let params = ["p1": "11111","p2": 22222] as [String : Any]
        
        FFNetwork.request(target: .post(url:url,params: params), success: { (result) in
            Log(result)
            let res=ListResponse<Entity>.deserialize(from: result as?String)
            
            Log(res)
            guard (res?.respond.ok)! else { return }
            
            completionHandler((res?.list)!)
            
        
        }) { (error) in
            Log(error.localizedDescription)
        }
    }
    
    static func getKlineChartData(market:String,symbol: String,quote:String, range: Int, size: Int,completionHandler:@escaping (Bool, [KlineChartData]) -> Void){
        
        let url = "/api/line/poll"
        let params = ["market": market,"symbol": symbol,"quote":quote,"range":String(range, radix: 10),"limit":String(size, radix: 10)] as [String : Any]
        
        FFNetwork.request(target: .post(url:url,params: params), success: { (result) in
            Log(result)
            let res=KlineResponse.deserialize(from: result as?String)
            
            Log(res)
            
              var lines=[KlineChartData]()
            
            if (res?.success)! {
                
                //lines: K线图, 依次是: 时间(ms), 开盘价, 最高价, 最低价, 收盘价, 成交量
                for  item in (res?.data?.lines)! {
                    let cd=KlineChartData()
                    cd.time = Int(item[0]/1000)
                    cd.openPrice = item[1]
                    cd.highPrice = item[2]
                    cd.lowPrice = item[3]
                    cd.closePrice = item[4]
                    cd.vol = item[5]
                    lines.append(cd)
                }
            }
        
            completionHandler((res?.success)!, lines)
            
            
        }) { (error) in
            Log(error.localizedDescription)
             completionHandler(false, [])
        }
        
//        var granularity = 300
//        switch timeType {
//        case "5min":
//            granularity = 5 * 60
//        case "15min":
//            granularity = 15 * 60
//        case "30min":
//            granularity = 30 * 60
//        case "1hour":
//            granularity = 1 * 60 * 60
//        case "2hour":
//            granularity = 2 * 60 * 60
//        case "4hour":
//            granularity = 4 * 60 * 60
//        case "6hour":
//            granularity = 6 * 60 * 60
//        case "1day":
//            granularity = 1 * 24 * 60 * 60
//        case "1week":
//            granularity = 7 * 24 * 60 * 60
//        default:
//            granularity = 300
//        }
        
        
    }
   
}

struct NetworkTool: NetworkToolProtocol {}
