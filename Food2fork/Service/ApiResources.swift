//
//  ApiResources.swift
//  Food2fork
//
//  Created by Suman Chatterjee on 04/02/2018.
//  Copyright © 2018 Suman Chatterjee. All rights reserved.
//

import Foundation
import UIKit

//Api key : a514f84afcb013e7b533f42653e5343c
//Url: http://food2fork.com/api/search?key=a514f84afcb013e7b533f42653e5343c&q=shredded%20chicken


enum ApiKeys {
    case publisher
}

protocol ApiResource  {
    associatedtype Model:Codable
    var apiType:ApiKeys { get }
    var recipeType : String { get }
    func makeModel(for data: Data) -> Model
}

extension ApiResource {
    var url: URL {
        let baseUrl = "http://food2fork.com/api/search"
        let apiKey = "key=a514f84afcb013e7b533f42653e5343c"
        let url = baseUrl + "?" + apiKey + "&q" + recipeType
        return URL(string: url)!
    }
    
    func makeModel(data: Data) -> [Model]? {
        do {
            let decoder = JSONDecoder()
            let result = try decoder.decode(Model.self, from:data)
            return result as? [Self.Model]
            } catch {
            print("JSON Error: \(error)")
            return []
        }
  }
}
