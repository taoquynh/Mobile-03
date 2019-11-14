//
//  ViewController.swift
//  DongHo
//
//  Created by Taof on 11/14/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let currentDate = NSDate()
    let calendar = NSCalendar.current
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hour = calendar.component(.hour, from: currentDate as Date)
        let minute = calendar.component(.minute, from: currentDate as Date)
        let second = calendar.component(.second, from: currentDate as Date)
        
        print(currentDate)
        print(calendar)
        print(hour, minute, second)
    }


}

