//
//  ViewController.swift
//  Food2fork
//
//  Created by Suman Chatterjee on 04/02/2018.
//  Copyright © 2018 Suman Chatterjee. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var networkService:NetworkService = NetworkService(for: .publisher)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //show Key Board
        self.searchBar.becomeFirstResponder
    }
}

// MARK: UISearchBarDelegate
extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        networkService.performSearch(for: "Chicken") { success in
            print("downloaded")
        }
    }
}

