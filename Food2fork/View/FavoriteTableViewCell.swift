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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
