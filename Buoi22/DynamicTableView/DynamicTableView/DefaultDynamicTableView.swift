//
//  DefaultDynamicTableView.swift
//  DynamicTableView
//
//  Created by Taof on 12/24/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class DefaultDynamicTableView: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var animals: [Animal]?
    override func viewDidLoad() {
        super.viewDidLoad()

        setupData()
        title = "Default Dynamic"
        configTable()
    }
    
    func configTable(){
        // gán delegate, datasource cho tableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.bounces = false
        tableView.separatorStyle = .none
    }
    
    func setupData(){
        animals = [
            Animal(animal: "Chó", feet: "4 feet", imageName: "cho"),
            Animal(animal: "Mèo", feet: "4 feet", imageName: "meo"),
            Animal(animal: "Chó", feet: "4 feet", imageName: "cho"),
            Animal(animal: "Mèo", feet: "4 feet", imageName: "meo"),
            Animal(animal: "Chó", feet: "4 feet", imageName: "cho"),
            Animal(animal: "", feet: "", imageName: "")
        ]
    }
}

extension DefaultDynamicTableView: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 1 {
            return 200
        }else{
        return 100
        }
    }
}

extension DefaultDynamicTableView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell?
        
        cell = tableView.dequeueReusableCell(withIdentifier: "id")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "id")
        }
        
//        cell?.textLabel?.text = String(indexPath.row)
        cell?.textLabel?.text = animals![indexPath.row].animal
        cell?.detailTextLabel?.text = animals![indexPath.row].feet
        cell?.imageView?.image = UIImage(named: animals![indexPath.row].imageName)
        return cell!
    }
    
    
}
