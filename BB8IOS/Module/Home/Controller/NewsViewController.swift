//
//  NewsViewController.swift
//  BB8IOS
//
//  Created by peak on 2018/5/31.
//  Copyright © 2018年 51bb8. All rights reserved.
//

import UIKit

class NewsViewController: WeexViewController {
    
    override func loadView() {
        super.loadView();
    }

    override func viewDidLoad() {
        
         self.url = URL.init(string:WeexBundleFolder + "index.js")
        super.viewDidLoad()
        Log(self.url)
      

        // Do any additional setup after loading the view.
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
