//
//  SecondViewController.swift
//  NavigationController
//
//  Created by Taof on 12/16/19.
//  Copyright © 2019 Taof. All rights reserved.

import UIKit

class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(goPress))
        
        let imageView = UIImageView(image: UIImage(named: "ruby"))
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView // đặt titleView thay vì title cho navigationBar
        
        navigationController?.navigationBar.barTintColor = .lightGray
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(cancelPress))
        navigationItem.leftBarButtonItem = cancelButton
    }
    
    @objc func cancelPress(){
        dismiss(animated: true, completion: nil)
    }
    
    @objc func goPress(){
        let thirdVC = ThirdViewController()
        
        navigationController?.pushViewController(thirdVC, animated: true)
    }
    
    
}
