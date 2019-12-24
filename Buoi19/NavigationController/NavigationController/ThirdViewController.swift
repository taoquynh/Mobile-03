//
//  ThirdViewController.swift
//  NavigationController
//
//  Created by Taof on 12/16/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .brown
        title = "Màn 3"
        // ẩn nút back trên thanh navigationBar
        self.navigationItem.setHidesBackButton(true, animated:true)
        // đổi màu title thanh navigationBar
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.orange]
        
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelPress))
        // đổi màu button trên thanh navigationBar
        cancelButton.tintColor = UIColor.orange
        navigationItem.leftBarButtonItem = cancelButton
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(goPress))
    }
    
    @objc func cancelPress(){
        navigationController?.popViewController(animated: true)
    }

    @objc func goPress(){
        let thirdVC = FourViewController()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .done, target: self, action: nil)
        navigationController?.pushViewController(thirdVC, animated: true)
    }

}
