//
//  MainScreen1.swift
//  DemoTabBarController
//
//  Created by Taof on 1/13/20.
//  Copyright © 2020 Taof. All rights reserved.
//

import UIKit

class MainScreen1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(addFunc))
    }
    
    @objc func addFunc(){
        let addVC = AddViewController()
        addVC.hidesBottomBarWhenPushed = true // ẩn TabBarController
        navigationController?.pushViewController(addVC, animated: true)
    }


}
