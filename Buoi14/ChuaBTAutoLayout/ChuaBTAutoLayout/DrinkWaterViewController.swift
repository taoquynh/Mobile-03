//
//  DrinkWaterViewController.swift
//  ChuaBTAutoLayout
//
//  Created by Taof on 11/23/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class DrinkWaterViewController: UIViewController {

    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
    }
    
    @objc func runTimer(){
        topConstraint.constant += 1
        if topConstraint.constant >= view.frame.size.height {
            timer.invalidate()
        }
    }
}
