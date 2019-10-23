//
//  GridViewController.swift
//  Container_Homework
//
//  Created by jerry on 10/20/19.
//  Copyright © 2019 lpmetor. All rights reserved.
//

import UIKit

class GridViewController: UIViewController {
    
    @IBOutlet weak var gridViewController: UICollectionView!
    
    var viewModel = ViewModel() {
        didSet {
            self.gridViewController.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGrid()
    }
    
    func setupGrid(){
        NotificationCenter.default.addObserver(forName: Notification.Name.ItemNotification, object: nil, queue: .main) { note in
            guard let userInfo = note.userInfo as? [String:ViewModel] else { return }
            
            self.viewModel = userInfo["ViewModel"]!
        }
    }
}

extension GridViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = viewModel.items[indexPath.row]
        viewModel.item = item
        goToDetail(with: viewModel)
    }
}

extension GridViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = gridViewController.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        let item = viewModel.items[indexPath.row]
        cell.item = item
        return cell
    }
    
}
