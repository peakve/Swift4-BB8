//
//  UserViewController.swift
//  BB8IOS
//
//  Created by peak on 2018/6/4.
//  Copyright © 2018年 51bb8. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func showHSStockChart(_ sender: Any) {
        
        //HSStock
        let viewController:StockViewController = StockViewController()
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    @IBAction func showCHKLineCharts(_ sender: Any) {
        
        //CHKLine
        
//        let viewController:UIViewController = UIStoryboard(name: "CHKLine", bundle: nil)
//            .instantiateInitialViewController() as! UIViewController
        
        let viewController:KLineViewController=KLineViewController()
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    @IBAction func showCharts(_ sender: Any) {
        
//        let viewController:DemoListViewController = UIStoryboard(name: "charts", bundle: nil)
//                            .instantiateInitialViewController() as! DemoListViewController
        
        //TODO charts
        let viewController:DemoListViewController = DemoListViewController()
    
        
        self.navigationController?.pushViewController(viewController, animated: true)
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
