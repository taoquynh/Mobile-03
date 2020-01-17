//
//  ListModelViewController.swift
//  iOSControl
//
//  Created by Taof on 4/20/19.
//  Copyright © 2019 Tào Quỳnh . All rights reserved.
//

import UIKit

class ListModelViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!    
    deinit {
        print("ListModel denit")
    }

    
    var posts = [Post]()
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "List Model"
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))
        navigationItem.rightBarButtonItem = addButton
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ListModelTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        
    }
    
    @objc func add(){
        
        // Hứng closure
        let createVC = CreateModelViewController()
        
        createVC.passObject = {
            [weak self] post in
            guard let strongSelf = self else {
                return
            }
            strongSelf.posts.append(post)
            strongSelf.tableView.reloadData()
        }
        
        navigationController?.pushViewController(createVC, animated: true)
    }
}

extension ListModelViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {      
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListModelTableViewCell
        cell.post = posts[indexPath.row]
        return cell
    }
}
