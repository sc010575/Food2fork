//
//  SearchRecipeCollectionViewCell.swift
//  Food2fork
//
//  Created by Suman Chatterjee on 05/02/2018.
//  Copyright © 2018 Suman Chatterjee. All rights reserved.
//

import UIKit

class SearchRecipeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    var downloadTask: URLSessionDownloadTask?

    
    override func prepareForReuse() {
        super.prepareForReuse()
        downloadTask?.cancel()
        downloadTask = nil
    }
    
    func configure(for result: Recipe) {
        
        guard let foodTitle = result.title,let iconUrl = result.imageUrl else {
            title.text = "Unknown"
            imageView.image = UIImage(named: "Placeholder")
            return
        }
        title.text = foodTitle
        if let smallURL = URL(string: iconUrl) {
            downloadTask = imageView.loadImage(url: smallURL)
        }
        
    }

}
