//
//  NetworkService.swift
//  Food2fork
//
//  Created by Suman Chatterjee on 04/02/2018.
//  Copyright © 2018 Suman Chatterjee. All rights reserved.
//

import Foundation
import UIKit

typealias SearchComplete = (Bool) -> Void

class NetworkService:ApiResource {
    var requestType: RequestType
    
    enum State {
        case notSearchedYet
        case loading
        case noResults
        case results([Recipe])
    }
    var recipeType : String = ""

    private var dataTask: URLSessionDataTask? = nil
    private(set) var state: State = .notSearchedYet
    
    init(for key: RequestType) {
        requestType = key
    }
    
    func performSearch(for text: String, completion: @escaping SearchComplete) {
            dataTask?.cancel()
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            
            // Update state
            var success = false
            state = .loading
            recipeType = text
            
            guard let url = self.url else {
                completion(success)
                return
            }
            
            let session = URLSession.shared
            dataTask = session.dataTask(with: url, completionHandler: {
                data, response, error in
                var newState = State.notSearchedYet
                // Was the search cancelled?
                if let error = error as NSError?, error.code == -999 {
                    return
                }
                
                if let httpResponse = response as? HTTPURLResponse,
                    httpResponse.statusCode == 200, let data = data {
                    var searchResults = self.parse(data: data)
                    if searchResults.isEmpty {
                        newState = .noResults
                    } else {
                        searchResults.sort(by: <)
                        newState = .results(searchResults)
                    }
                    success = true
                }
                DispatchQueue.main.async {
                    self.state = newState
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                    completion(success)
                }
            })
            dataTask?.resume()
    }
}
    
    // MARK:- Private Methods
private extension NetworkService {
    
    func parse(data: Data) -> [Recipe] {
        do {
            let decoder = JSONDecoder()
            let result = try decoder.decode(ResultArray.self, from:data)
            return result.results
        } catch {
            print("JSON Error: \(error)")
            return []
        }
    }
}


