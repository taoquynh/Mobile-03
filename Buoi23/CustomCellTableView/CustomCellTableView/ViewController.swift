//
//  ViewController.swift
//  CustomCellTableView
//
//  Created by Taof on 12/31/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    let idCell1: String = "Cell1"
    let idCell2: String = "Cell2"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // đăng kí cell
        // đăng kí cell có giao diện (file xib)
        tableView.register(UINib(nibName: "CustomCell1", bundle: nil), forCellReuseIdentifier: idCell1)
        // đăng kí cell không có file giao diện
        tableView.register(CustomCell2.self, forCellReuseIdentifier: idCell2)
    }

    func setupLayout(){
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    // hàm này trả về section
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // hàm này trả về số hàng trong một section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 10
        }else{
            return 15
        }
    }
    
    // hàm này trả về title của section
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Cell sử dụng file xib"
        }else{
            return "Cell không có file xib"
        }
    }
    
    // hàm này trả về chiều cao của section header
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    //
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.section == 0 {
//            return 80
//        }else{
//            return 100
//        }
        //(chỉ hoạt động khi layout chuẩn)
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: idCell1, for: indexPath) as! CustomCell1
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: idCell2, for: indexPath) as! CustomCell2
            
            return cell
        }
    }
}
