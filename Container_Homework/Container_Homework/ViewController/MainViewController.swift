//
//  ViewController.swift
//  Container_Homework
//
//  Created by jerry on 10/20/19.
//  Copyright © 2019 lpmetor. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var listViewController: UIView!
    @IBOutlet weak var gridViewController: UIView!
    
    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMain()
    }
    
    private func setupMain() {
        viewModel.get()
        print("Hello ... \(viewModel.items.count)")
        definesPresentationContext = true
    }
    
    @IBAction func switchButtonTapped(_ sender: UIBarButtonItem) {
        listViewController.isHidden.toggle()
        gridViewController.isHidden.toggle()
    }
    
}

