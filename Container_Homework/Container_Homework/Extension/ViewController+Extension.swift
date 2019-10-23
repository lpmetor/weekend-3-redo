//
//  ViewController+Extension.swift
//  Container_Homework
//
//  Created by jerry on 10/20/19.
//  Copyright © 2019 lpmetor. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func goToDetail(with vm: ViewModel) {
        
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailVC.viewModel = vm
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
