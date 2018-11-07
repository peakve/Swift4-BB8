//
//  WXEventModule.swift
//  SwiftWeexSample
//
//  Created by zifan.zx on 24/09/2016.
//  Copyright © 2016 com.taobao.weex. All rights reserved.
//

import Foundation

public extension WXEventModule {
    
    @objc public func openURL(_ url:String) {
        var newUrl:String = url;
        if url.hasPrefix("//") {
            newUrl = String.init(format: "http://%@", url);
        }else if !url.hasPrefix("http") {
            //relative path
            newUrl = (URL.init(string: url, relativeTo: weexInstance.scriptURL)!.absoluteString)
        }
        
        let controller:WeexViewController = WeexViewController()
        controller.url = URL.init(string: newUrl)
        weexInstance.viewController.navigationController?.pushViewController(controller, animated:true)
    }
    
    //TODO
    @objc public func fireNativeGlobalEvent(event:String,callback:WXModuleCallback){
        
        weexInstance .fireGlobalEvent(event,params: ["eventParam":"eventValue"])
        
        if callback != nil {
            callback(["ok":true]);
        }
        
    }
    
    /**
     a test method for macaca case, you can fire globalEvent when download finish、device shaked and so on.
     @param event event name
     */
//    - (void)fireNativeGlobalEvent:(NSString *)event callback:(WXModuleCallback)callback
//    {
//    [weexInstance fireGlobalEvent:event params:@{@"eventParam":@"eventValue"}];
//    if (callback) {
//    NSDictionary * result = @{@"ok": @true};
//    callback(result);
//    }
//    }
    
}
