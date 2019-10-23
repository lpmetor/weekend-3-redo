//
//  ListViewController.swift
//  Container_Homework
//
//  Created by jerry on 10/20/19.
//  Copyright © 2019 lpmetor. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = ViewModel() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupList()
    }
    
    func setupList() {
        tableView.tableFooterView = UIView(frame: .zero)
        
        NotificationCenter.default.addObserver(forName: Notification.Name.ItemNotification, object: nil, queue: .main) { note in
            guard let userInfo = note.userInfo as? [String:ViewModel] else { return }
            
            self.viewModel = userInfo["ViewModel"]!
        }
    }
}
extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//       return UITableView.automaticDimension
                return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = viewModel.items[indexPath.row]
        viewModel.item = item
        goToDetail(with: viewModel)
    }
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        print("indexPath.row = \(indexPath.row)")
        let item = viewModel.items[indexPath.row]
        
        cell.item = item
        print(cell)
        return cell
    }
}

