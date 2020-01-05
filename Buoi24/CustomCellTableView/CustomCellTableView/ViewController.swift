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
    
    var foods: [Food] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupData()
        setupLayout()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // đăng kí cell
        // đăng kí cell có giao diện (file xib)
        tableView.register(UINib(nibName: "CustomCell1", bundle: nil), forCellReuseIdentifier: idCell1)
        // đăng kí cell không có file giao diện
        tableView.register(CustomCell2.self, forCellReuseIdentifier: idCell2)
    }
    
    func setupData(){
        
        let food1 = Food(imageName: "cafedeadend.jpg", name: "Cafe Deadend", description: "Lorem Ipsum is simply ", isSelected: false )
        let food2 = Food(imageName: "homei.jpg", name: "Homei", description: "\"Lorem Ipsum\" has been the industry's standard dummy text ever the 1500s,", isSelected: true )
        let food3 = Food(imageName: "teakha.jpg", name: "Teakha", description: "when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,", isSelected: false )
        let food4 = Food(imageName: "cafeloisl.jpg", name: "Cafe Loisl", description: "It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", isSelected: true )
        let food5 = Food(imageName: "petiteoyster.jpg", name: "Petite Oyster", description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.", isSelected: false )
        let food6 = Food(imageName: "forkeerestaurant.jpg", name: "For Kee Restaurant", description: "Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy.", isSelected: false )
        let food7 = Food(imageName: "posatelier.jpg", name: "Po's Atelier", description: "Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).", isSelected: false )
        let food8 = Food(imageName: "bourkestreetbakery.jpg", name: "Bourke Street Bakery", description: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.", isSelected: false )
        let food9 = Food(imageName: "haighschocolate.jpg", name: "Haigh's Chocolate", description: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.", isSelected: false )
        let food10 = Food(imageName: "palominoespresso.jpg", name: "Palomino Espresso", description: "If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text.", isSelected: false )
        
        foods = [food1, food2, food3, food4, food5, food6, food7, food8, food9, food10]
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
            return foods.count
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
            // cách đổ dữ liệu thứ nhất
            //            cell.photoImageView.image = UIImage(named: foods[indexPath.row].imageName)
            //            cell.nameLabel.text = foods[indexPath.row].name
            //            cell.descriptionLabel.text = foods[indexPath.row].description
            //            cell.checkImageView.image = UIImage(named: foods[indexPath.row].isSelected ? "checked" : "uncheck")
            
            // cách đổ dữ liệu thứ hai
            // đổ dữ liệu một cục
            cell.food = foods[indexPath.row]
            
            //hứng closure
            cell.passAction = { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.foods[indexPath.row].isSelected.toggle()
                strongSelf.tableView.reloadData()
            }
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: idCell2, for: indexPath) as! CustomCell2
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Bạn đã chọn \(foods[indexPath.row].name)")
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            foods.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .normal, title: "Delete") { [weak self] (_, _) in
            guard let strongSelf = self else { return }
            strongSelf.foods.remove(at: indexPath.row)
            strongSelf.tableView.reloadData()
        }
        
        let edit = UITableViewRowAction(style: .normal, title: "Edit") { [weak self] (_, _) in
            guard let _ = self else { return }
        }
        delete.backgroundColor = UIColor.red
        edit.backgroundColor = UIColor.blue
        
        return [delete, edit]
    }
}
