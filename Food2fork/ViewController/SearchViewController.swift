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
        
        guard let recipeText = searchBar.text else { return }
        networkService.performSearch(for: recipeText ,completion: { success in
            if !success {
  //              self.showNetworkError()
            }
            self.collectionView.reloadData()
        })
        collectionView.reloadData()
    }
}


// MARK:

extension SearchViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch networkService.state {
        case .notSearchedYet:
            return 0
        case .loading:
            return 1
        case .noResults:
            return 1
        case .results(let list):
            return list.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch networkService.state {
        case .notSearchedYet:
            fatalError("Should never get here")
            
        case .loading,.noResults:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NoResultCell", for: indexPath)
            return cell
        case .results(let list):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: SearchRecipeCollectionViewCell.self), for: indexPath)
            if let cell = cell as? SearchRecipeCollectionViewCell {
                let searchResult = list[indexPath.row]
                cell.configure(for: searchResult)
            }
            return cell
        }
    }

    
}
// MARK: UICollectionViewDelegateFlowLayout
extension SearchViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  50
        let collectionViewSize = collectionView.frame.size.width - padding

        switch networkService.state {
            
            case .notSearchedYet,.loading,.noResults:
                
                return CGSize(width: collectionViewSize, height: collectionViewSize)

            case .results:
                return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)

        }
     }

}
