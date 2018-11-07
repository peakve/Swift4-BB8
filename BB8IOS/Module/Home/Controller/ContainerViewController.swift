//
//  ContainerViewController.swift
//  BB8IOS
//
//  Created by peak on 2018/5/31.
//  Copyright © 2018年 51bb8. All rights reserved.
//

import Foundation
import SlideMenuControllerSwift

class ContainerViewController: SlideMenuController {
    
    override func awakeFromNib() {
     
        let mcontroller=UIStoryboard(name: "Main", bundle: nil)
            .instantiateInitialViewController() as! MainViewController
         self.mainViewController = mcontroller
        
        
        let lcontroller=UIStoryboard(name: "Left", bundle: nil)
            .instantiateInitialViewController()
            self.leftViewController = lcontroller
        
        super.awakeFromNib()
    }
    
}
