//
//  FavoriteTableViewCell.swift
//  Food2fork
//
//  Created by Suman Chatterjee on 05/02/2018.
//  Copyright © 2018 Suman Chatterjee. All rights reserved.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {

    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var publisher: UILabel!
    
    var downloadTask: URLSessionDownloadTask?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        downloadTask?.cancel()
        downloadTask = nil
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    // MARK:- Public Methods
    func configure(for result: Recipe) {
        
        guard let foodTitle = result.title,let iconUrl = result.imageUrl, let publisherName = result.publisher else {
                title.text = "Unknown"
                publisher.text = "Unknown"
                foodImage.image = UIImage(named: "Placeholder")
            return
        }
        title.text = foodTitle
        publisher.text = publisherName
        if let smallURL = URL(string: iconUrl) {
            downloadTask = foodImage.loadImage(url: smallURL)
        }

    }

}
