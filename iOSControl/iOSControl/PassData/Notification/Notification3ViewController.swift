//
//  Notification3ViewController.swift
//  iOSControl
//
//  Created by Tào Quỳnh on 4/22/19.
//  Copyright © 2019 Tào Quỳnh . All rights reserved.
//

import UIKit

class Notification3ViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var feelTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Noti 3"
    }

    @IBAction func onPress(_ sender: UIButton) {
        // B1: Tạo một biến có kiểu dữ liệu của 1 object cần truyền dữ liệu
        let post = Post(title: titleTextField.text!, feel: feelTextField.text!)
        
        // B2: Push thông báo
        NotificationCenter.default.post(name: .notificationNamePost, object: post)
        
    }
}
