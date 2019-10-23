//
//  CollectionViewCell.swift
//  Container_Homework
//
//  Created by jerry on 10/20/19.
//  Copyright © 2019 lpmetor. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var contextLabel: UILabel!
    
    static let identifier = "CollectionViewCell"
    
    var item: Item! {
        didSet {
            numberLabel.text = String(item.id)
            contextLabel.text = item.title
            item.getBigImage { [weak self] img in
                self?.itemImage.image = img
            }
        }
    }
}
