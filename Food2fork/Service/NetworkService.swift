//
//  NetworkService.swift
//  Food2fork
//
//  Created by Suman Chatterjee on 04/02/2018.
//  Copyright © 2018 Suman Chatterjee. All rights reserved.
//

import Foundation
import UIKit

class NetworkService {
    enum State {
        case notSearchedYet
        case loading
        case noResults
        case results([Recipe])
    }
}
