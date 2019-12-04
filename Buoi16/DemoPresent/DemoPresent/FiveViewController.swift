//
//  FiveViewController.swift
//  DemoPresent
//
//  Created by Taof on 12/3/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class FiveViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
    }
    
    @objc func cancel(){
        navigationController?.popViewController(animated: true)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
