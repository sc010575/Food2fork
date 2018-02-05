//
//  FavoriteViewModel.swift
//  Food2fork
//
//  Created by Suman Chatterjee on 05/02/2018.
//  Copyright © 2018 Suman Chatterjee. All rights reserved.
//

import Foundation

typealias CompletionHandler = (Bool) -> Void

class FavoriteViewModel {

    struct FavoriteView {
        var imageUrl : URL
        var title:String
        var publisher:String
        
        init(_ imageUrl:URL, title:String,publisher:String) {
            
            self.imageUrl = imageUrl
            self.title = title
            self.publisher = publisher
        }

    }
}

