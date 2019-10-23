//
//  ItemAPI.swift
//  Google_Vendor
//
//  Created by Sky on 9/24/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import Foundation


struct ItemAPI {
    //https://jsonplaceholder.typicode.com/photos
    
    let base = "https://jsonplaceholder.typicode.com/photos"
    
    var getUrl: URL? {
        return URL(string: base)
    }
    
}
