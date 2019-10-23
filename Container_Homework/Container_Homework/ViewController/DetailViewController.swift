//
//  DetailViewController.swift
//  Container_Homework
//
//  Created by jerry on 10/20/19.
//  Copyright © 2019 lpmetor. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var imageDetail: UIImageView!
    
    var viewModel: ViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.item.getBigImage{ [weak self] img in
            self?.imageDetail.image = img
        }
    }
}
