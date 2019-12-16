//
//  MainViewController.swift
//  NavigationController
//
//  Created by Taof on 12/16/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func goPress(_ sender: Any) {
        let secondVC = SecondViewController()
        let navigation = UINavigationController(rootViewController: secondVC)
        
        navigation.modalPresentationStyle = .fullScreen
        present(navigation, animated: true, completion: nil)
    }
    
}
