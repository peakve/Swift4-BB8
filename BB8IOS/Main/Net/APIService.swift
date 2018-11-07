//
//  APIService.swift
//  BB8IOS
//
//  Created by peak on 2018/5/30.
//  Copyright © 2018年 51bb8. All rights reserved.
//

import Foundation
import Moya
import SwiftyJSON
import SwiftyJSONMappable



// 网络请求结构体
struct FFNetwork {
    
    // 请求成功的回调
    typealias successCallback = (_ result: Any) -> Void
    // 请求失败的回调
    typealias failureCallback = (_ error: MoyaError) -> Void
    
    // 设置请求头
//    static let myEndpointClosure = { (target: Target) -> Endpoint<Target> in
//
//
//        let url1 = target.baseURL as URL
//        let url2 = url1.appendingPathComponent(target.path)
//
//        let endpoint: Endpoint<Target> = Endpoint<Target>(
//            url: url2.absoluteString,
//            sampleResponseClosure: {.networkResponse(200, target.sampleData)},
//            method: target.method,
//            parameters: target.parameters
//        )
//
//        return endpoint.adding(newHTTPHeaderFields: headerFields)// 请求头
//    }
//
//    // 设置超时时常等
//    static let myRequestClosure = {(endpoint: Endpoint<Target>, closure: MoyaProvider<Target>.RequestResultClosure) -> Void in
//        if var urlRequest = endpoint.urlRequest {
//            urlRequest.timeoutInterval = 10// 超时时长 // TODO: 修改超时时长
//            closure(.success(urlRequest))
//        } else {
//            closure(.failure(MoyaError.requestMapping(endpoint.url)))
//        }
//    }

    //         plugin：log、loading等

    static let myNetworkLoggerPlugin = NetworkLoggerPlugin(verbose: true, responseDataFormatter: { (data: Data) -> Data in
        //            return Data()
        do {
            let dataAsJSON = try JSONSerialization.jsonObject(with: data)// Data 转 JSON
            let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)// JSON 转 Data，格式化输出。
            return prettyData
        } catch {
            return data
        }
    })

    // MARK: - 自定义的网络提示请求插件
    static let myNetworkPlugin = MyNetworkActivityPlugin { (state,target) in
        if state == .began {
           FLog("request begin>>>>")
            
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        } else {
            print("request end>>>")
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            
        }
    }

        // 单例
//    endpointClosure: myEndpointClosure,requestClosure: myRequestClosure,
    static let provider = MoyaProvider<APIService>( plugins:[myNetworkPlugin,myNetworkLoggerPlugin])
    // 发送网络请求
    static func request(
        target: APIService,
//        jMappable:JSONMappable,
        success: @escaping successCallback,
        failure: @escaping failureCallback
        ) {
        
        provider.request(target) { result in
            
//            FLog(result)
            
            switch result {
            case let .success(moyaResponse):
                do {
//                    try success(moyaResponse.mapJSON())
//                    FLog(try moyaResponse.mapJSON())
//
//                    FLog(moyaResponse.data)
//                    FLog(moyaResponse.statusCode)
              
                    try success(moyaResponse.mapString())
                    
//                    success(JSON(data: moyaResponse.data))
//                   let j=try moyaResponse.mapJSONMappable(Response.self)
//                    Log(j)
                    
                } catch {
                    failure(MoyaError.jsonMapping(moyaResponse))
                }
            case let .failure(error):
                failure(error)
            }
        }
    }
}


// 定义请求方法
enum APIService {
    case demo1
    case get(url:String,params:[String: Any] )
    case post(url: String,params:[String: Any])
//    case uploadFile(value1: String, value2: Int, file1Data:Data, file2URL:URL)
}

extension APIService: TargetType {
    
    // 请求服务器的根路径
    //https://httpbin.org   http://www.51bb8.com/web
    var baseURL: URL {
        
        switch self {
//        case .request( _, _, _):
//            return URL(string: "https://www.51bb8.com/web")!
        default:
            return URL(string: "https://www.51bb8.com/web")!
        }
    }
    
    // 每个API对应的具体路径
    var path: String {
        switch self {
        case .demo1:
            return "/get"
        case .get(let url,let params):
            return "\(url)"
        case .post(let url,let params):
            return "\(url)"
        }
        
    }
    
    // 各个接口的请求方式，get或post
    var method: Moya.Method {
        switch self {
        case .demo1:
            return .get
        case .get:
             return .get
        case .post:
            return .post
        }
        
    }
    
    // 请求是否携带参数，如果需要参数，就做如demo2和demo3的设置
    var task: Task {
        switch self {
        case .demo1:
            return .requestPlain // 无参数
        case let .get(url,params): // 带有参数,注意前面的let
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        case let .post(url, params): // 带有参数,注意前面的let
            return .requestParameters(parameters: params, encoding: JSONEncoding.default)
            
        }
    }
    
    // 单元测试使用
    var sampleData: Data {
        switch self {
        case .demo1, .get:
            return "just for test".utf8Encoded
        case .post(let url):
            return "{\"name\": \(url)\"}".utf8Encoded
        }
    }
    
    // 请求头
    var headers: [String : String]? {
        return ["Content-type" : "application/json"]
    }
}

// 扩展方法
private extension String {
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
