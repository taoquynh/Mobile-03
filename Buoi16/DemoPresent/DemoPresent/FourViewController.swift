//
//  FourViewController.swift
//  DemoPresent
//
//  Created by Taof on 12/3/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class FourViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Four ViewController"
//        navigationItem.title = "Four"
        
        let cameraBarButton = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(tapCamera))
        let newBarButton = UIBarButtonItem(title: "New", style: .done, target: self, action: #selector(tapCamera))
        navigationItem.rightBarButtonItems = [cameraBarButton, newBarButton]
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(tapCamera))
        
    }
    
    @objc func tapCamera(){
        print("tap")
        let fiveVC = FiveViewController()
        navigationController?.pushViewController(fiveVC, animated: true)
    }
    
}
