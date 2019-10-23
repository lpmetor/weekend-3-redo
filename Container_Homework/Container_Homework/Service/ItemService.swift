//
//  ItemService.swift
//  Google_Vendor
//
//  Created by Sky on 9/24/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import Foundation

final class ItemService {
    
    static let shared = ItemService()
    
    private init() {}
    
    func getItems( completion: @escaping ([Item]) -> Void) {
        
        guard let url = ItemAPI().getUrl else {
            completion([])
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as! [[String:Any]]
            var items = [Item]()
            for dict in jsonResponse {
                if let item = Item(dict: dict) {
                    items.append(item)
                }
            }
            print("Successfully download data")
            completion(items)
        } catch {
            print("Couldn't Serialize JSON: \(error.localizedDescription)")
            completion([])
            return
        }
    }
}
