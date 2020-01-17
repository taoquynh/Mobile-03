//
//  Notification2ViewController.swift
//  iOSControl
//
//  Created by Tào Quỳnh on 4/22/19.
//  Copyright © 2019 Tào Quỳnh . All rights reserved.
//

import UIKit

class Notification2ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var feelLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Noti 2"
        // đăng kí nhận thông báo khi khởi tạo màn hình
        NotificationCenter.default.addObserver(self, selector: #selector(notification(_:)), name: .notificationNamePost, object: nil)
    }

    @objc func notification(_ notification: Notification){
        // B3: ép kiểu biến nhận thông báo giống với kiểu đã được push
        if let post = notification.object as? Post{
            
            titleLabel.text = post.title
            feelLabel.text = post.feel
            // push thông báo
        }
        
        print("Notification2ViewController")
    }
    
    @IBAction func onBackPress(_ sender: UIButton) {
        navigationController?.pushViewController(Notification3ViewController(), animated: true)
    }
}
