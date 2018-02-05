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
//Url: https://food2fork.com/api/search?key=a514f84afcb013e7b533f42653e5343c&q=shredded%20chicken


enum RequestType {
    case favourite
    case publisher
}

protocol ApiResource  {
    var requestType:RequestType { get }
    var recipeType : String { get }
}

extension ApiResource {
    var url: URL? {
        let baseUrl = "https://food2fork.com/api/search"
        let apiKey = "key=a514f84afcb013e7b533f42653e5343c"
        let parameter = requestType == .favourite ? "" : "&q" + recipeType
        let url = baseUrl + "?" + apiKey + parameter
        guard let finalUrl = URL(string: url) else { return nil}
        return finalUrl
    }
}
