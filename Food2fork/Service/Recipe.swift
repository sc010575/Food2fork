//
//  Recipe.swift
//  Food2fork
//
//  Created by Suman Chatterjee on 04/02/2018.
//  Copyright © 2018 Suman Chatterjee. All rights reserved.
//

class ResultArray:Codable {
    var resultCount = 0
    var results = [Recipe]()
}

class Recipe: Codable {
    
    var publisher:String?
    var f2fUrl:String?
    var title:String?
    
     enum CodingKeys: String, CodingKey {
        case publisher
        case f2fUrl = "f2f_url"
        case title
    }
}
