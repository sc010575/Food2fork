//
//  MainTabBarViewController.swift
//  Food2fork
//
//  Created by Suman Chatterjee on 05/02/2018.
//  Copyright © 2018 Suman Chatterjee. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.selectedIndex = 0
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.tintColor = .blue
        self.title = "Recipe Fevorite"
    }
}

extension MainTabBarController : UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let tabBarIndex = tabBarController.selectedIndex
        
        if tabBarIndex == 0 {
            self.title = "Recipe Fevorite"
        } else{
            self.title = "Recipe Search"
        }
    }

}
