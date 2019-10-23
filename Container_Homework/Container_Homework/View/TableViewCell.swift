//
//  TableViewCell.swift
//  Container_Homework
//
//  Created by jerry on 10/20/19.
//  Copyright © 2019 lpmetor. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    static let identifier = "TableViewCell"
    
    var item: Item! {
        didSet {
            numberLabel.text = String(item.id)
            contentLabel.text = item.title
            
            item.getSmallImage{ [weak self] img in
                self?.itemImage.image = img
            }
        }
    }
}
