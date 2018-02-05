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
    enum CodingKeys: String, CodingKey {
      case resultCount = "count"
      case results = "recipes"
    }
    
}

class Recipe: Codable {
    
    var publisher:String?
    var f2fUrl:String?
    var title:String?
    var sourceURL: String?
    var recipeId : String?
    var socialRank : Double?
    var publisherUrl: String
    var imageUrl : String?
    
     enum CodingKeys: String, CodingKey {
        case publisher
        case f2fUrl = "f2f_url"
        case title
        case sourceURL = "source_url"
        case recipeId = "recipe_id"
        case socialRank = "social_rank"
        case publisherUrl = "publisher_url"
        case imageUrl = "image_url"
        
    }
}

func < (lhs: Recipe, rhs: Recipe) -> Bool {
    
    guard  let publisher = lhs.publisher , let newPublisher = rhs.publisher  else {
        return false
    }
    return publisher.localizedStandardCompare(newPublisher) == .orderedAscending
}
