//
//  YellowViewController.swift
//  DemoPresent
//
//  Created by Taof on 12/3/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class YellowViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onNext(_ sender: Any) {
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let pinkVC = mainStoryBoard.instantiateViewController(withIdentifier: "PinkViewController") as! PinkViewController
        present(pinkVC, animated: true, completion: nil)
    }
    
    @IBAction func onCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
