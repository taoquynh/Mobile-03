//
//  Notification1ViewController.swift
//  iOSControl
//
//  Created by Tào Quỳnh on 4/22/19.
//  Copyright © 2019 Tào Quỳnh . All rights reserved.
//

import UIKit

class Notification1ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var feelLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Noti 1"
        // đăng kí thông báo khi khởi tạo màn hình
        NotificationCenter.default.addObserver(self, selector: #selector(notification(_:)), name: .noticicationNameBlog, object: nil)
    }
    
    @objc func notification(_ notification: Notification){
        if let post = notification.object as? Post{
            titleLabel.text = post.title
            feelLabel.text = post.feel
        }
        print("Notification1ViewController")
    }

    @IBAction func onPress(_ sender: UIButton) {
        navigationController?.pushViewController(Notification2ViewController(), animated: true)
    }
    
}
