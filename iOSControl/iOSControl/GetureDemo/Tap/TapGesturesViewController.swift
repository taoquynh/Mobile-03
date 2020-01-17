//
//  TapGesturesViewController.swift
//  iOSControl
//
//  Created by Tào Quỳnh on 4/10/19.
//  Copyright © 2019 Tào Quỳnh . All rights reserved.
//

import UIKit

class TapGesturesViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Tap gesture"
    }

    @IBAction func viewDidTap(_ sender: Any) {
        print("view did tap")
    }
}
