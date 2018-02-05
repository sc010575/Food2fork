//
//  ViewController.swift
//  Food2fork
//
//  Created by Suman Chatterjee on 04/02/2018.
//  Copyright © 2018 Suman Chatterjee. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    var networkService:NetworkService = NetworkService(for: .publisher)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkService.performSearch(for: "Chicken") { success in
            print("downloaded")
        }
    }


}

