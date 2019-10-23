//
//  ViewModel.swift
//  Container_Homework
//
//  Created by jerry on 10/20/19.
//  Copyright © 2019 lpmetor. All rights reserved.
//

import Foundation

class ViewModel {
    
    var item: Item!
    var items = [Item]() {
        didSet {
            let userInfo: [String:ViewModel] = ["ViewModel":self]
            NotificationCenter.default.post(name: Notification.Name.ItemNotification, object: nil, userInfo: userInfo)
        }
    }
    
    func get() {
        ItemService.shared.getItems() { [weak self] itemss in
            self?.items = itemss
            print("Item count: \(itemss.count)")
        }
    }
}
