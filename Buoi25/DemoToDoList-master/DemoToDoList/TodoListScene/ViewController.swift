//
//  ViewController.swift
//  DemoToDoList
//
//  Created by Hoang Tung on 1/5/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var todoListArray: [User]?
    
    let listToDoTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupNavigation()
        setupData()
        setupLayout()
        configTable()
    }

    func setupData() {
        todoListArray = [
            User(name: "John", phone: "0912345678", image: UIImage(named: "avatar")!),
            User(name: "Marry", phone: "0912345678", image: UIImage(named: "avatar2")!),
            User(name: "Peter", phone: "0912345678", image: UIImage(named: "avatar3")!),
            
        ]
    }
    
    func setupNavigation() {
//        Đặt title cho navigation bar
        navigationItem.title = "List Item"
//        Thêm Add button vào bên phải thanh navigation
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(routingNewItemViewController))
    }
    
//    Chuyển hướng màn hình sang page NewItem
    @objc func routingNewItemViewController() {
        let newItemViewController = NewItemViewController()
        
        // bước 3: hứng closure
        // đi vào cửa nào thì ra ở cửa đó
        newItemViewController.passData = { [weak self] data in
            guard let strongSelf = self else { return }
            strongSelf.todoListArray?.append(data)
            strongSelf.listToDoTableView.reloadData()
        }
        navigationController?.pushViewController(newItemViewController, animated: true)
    }
    
    func setupLayout() {
        view.addSubview(listToDoTableView)
        listToDoTableView.backgroundColor = .purple
        let margin = view.safeAreaLayoutGuide
        listToDoTableView.topAnchor.constraint(equalTo: margin.topAnchor, constant: 0).isActive = true
        listToDoTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        listToDoTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        listToDoTableView.bottomAnchor.constraint(equalTo: margin.bottomAnchor, constant: 0).isActive = true
    }
    
    func configTable() {
        listToDoTableView.delegate = self
        listToDoTableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoListArray!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ToDoTableViewCell()
        cell.todo = todoListArray![indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UIView.animate(withDuration: 1, delay: 0.2, options: [], animations: {
            tableView.deselectRow(at: indexPath, animated: true)
        })
        
    }
}
