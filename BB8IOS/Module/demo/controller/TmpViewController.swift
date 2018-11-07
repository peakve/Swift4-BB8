//
//  TmpViewController.swift
//  BB8IOS
//
//  Created by peak on 2018/5/30.
//  Copyright © 2018年 51bb8. All rights reserved.
//

import UIKit

class TmpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        FFNetwork.request(target: .demo1, success: { (result) in
            //            Log(result)
            //            guard let internet = Internet(JSON: (result as! [String : AnyObject])) else { return }
            //            Log(internet.origin)
            //            Log(internet.url)
            //            Log(internet.Connection)
            //            Log(internet.Host)
            //            Log(internet.Agent)
        }) { (error) in
            Log(error.localizedDescription)
        }
        ///
        FFNetwork.request(target: .post(url:"api/news/list",params: ["category":"bv"]), success: { (result) in
            //            Log(result)
        }) { (error) in
            Log(error.localizedDescription)
        }
    
        ////api/market/query
        FFNetwork.request(target: .post(url:"api/market/query",params: ["am":-1]), success: { (result) in
            Log(result)
            let res=ListResponse<Market>.deserialize(from: result as!String)
            Log(res)
        }) { (error) in
            Log(error.localizedDescription)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
