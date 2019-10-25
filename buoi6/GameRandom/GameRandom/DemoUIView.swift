//
//  DemoUIView.swift
//  GameRandom
//
//  Created by Taof on 10/24/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class DemoUIView: UIViewController {

    @IBOutlet weak var blueView: UIView!
    
    // chiều rộng thiết bị
    let screenWidth = UIScreen.main.bounds.width
    
    // chiều cao thiết bị
    let screenHeight = UIScreen.main.bounds.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(screenWidth, screenHeight)
        
        // ViewController tạo sẵn một superView có tên là view, vì vậy khi đặt tên biến không đặt trùng với biến view này
        view.backgroundColor = UIColor.gray
        blueView.backgroundColor = UIColor.green
        
        // kích thước và toạ độ của thiết bị
        print("kích thước và toạ độ của thiết bị")
        print(view.frame)
        print(view.bounds)
        
        // kích thước và toạ độ của blueView
        print("kích thước và toạ độ của blueView")
        print(blueView.frame)
        print(blueView.bounds)
        
        blueView.frame.size = CGSize(width: 120, height: 120)
        blueView.center = view.center// đặt tâm blueView trùng với tâm superView
        
//        blueView.layer.cornerRadius = blueView.frame.width/2 // set blueView thành hình tròn
        blueView.transform = CGAffineTransform(rotationAngle: CGFloat.pi/4) // xoay blueView một góc 45 độ
 }
    
}
