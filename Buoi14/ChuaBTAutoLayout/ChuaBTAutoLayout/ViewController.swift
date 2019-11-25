//
//  ViewController.swift
//  ChuaBTAutoLayout
//
//  Created by Taof on 11/23/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var contentView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupCorneradius()
    }

    func setupCorneradius(){
    redView.layer.cornerRadius = redView.frame.size.width/2
    redView.layer.masksToBounds = true
    }
}

