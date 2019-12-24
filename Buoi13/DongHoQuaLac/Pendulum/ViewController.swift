//
//  ViewController.swift
//  Pendulum
//
//  Created by Techmaster on 3/19/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bulova: UIImageView!
    var pendulum: UIImageView!
    var gameTimer: Timer!
    var alpha: CGFloat = 0.0
    var deltaAlpha = CGFloat.pi / 180.0
    var swingAngle: CGFloat = CGFloat.pi * 0.1
    override func viewDidLoad() {
        super.viewDidLoad()
        setupControl()
    }
    
    func setupControl() {
        
        bulova.center = self.view.center
        pendulum = UIImageView(image: UIImage(named: "pendulum"))
        pendulum.frame = CGRect(x: 0, y: 0, width: 99, height: 295)
        pendulum.contentMode = .scaleAspectFit
        
        /* Đây là phần quan trọng tinh túy nhất của dự án.
         Để con lắc xoay quanh tâm quay của kim đồng hồ, chúng ta phải đổi anchorPoint của con lắc từ giá trị
         mặc định CGPoint(0.5, 0.5), đển tâm quay của kim đồng hồ.
         
         Tâm quay của kim cách đỉnh (top) của ảnh con lắc là 255 - 145.
         255 là khoảng cách từ đỉnh bulova đến con lắc
         145 là khoảng cách từ đỉnh bulova đến tâm quay
         295 là chiều cao của con lắc.
         Tâm quay nếu tính theo trục y thì nằm bên trái gốc tọa độ do đó anchorPoint theo hướng trục y là
         - (255-145)/295
         anchorPoint theo hướng trục x vẫn nằm chính giữa do đó giữ nguyên.
         
         Khi ta chuyển anchorPoint của con lắc trùng với tâm quay kim đồng hồ, thì việc đặt con lắc nên sử dụng thuộc
         tính center của nó. Lúc này điểm center của con lắc cũng chính là tọa độ của tâm quay
         
        */
        pendulum.layer.anchorPoint = CGPoint(x: 0.5, y: -(255-145)/295)
        pendulum.center = CGPoint(x: 143, y: 145)
        
        
        bulova.addSubview(pendulum)
       
        //Repeat every second
        gameTimer = Timer.scheduledTimer(timeInterval: 0.0333, target: self, selector: #selector(runTimerLoop), userInfo: nil, repeats: true)
        
    }
    @objc func runTimerLoop() {
        alpha += deltaAlpha
        
        //Logic đảo hướng lắc khi góc lệch hơn giá trị xác định swingAngle
        if alpha > swingAngle {
            alpha = swingAngle
            deltaAlpha = -deltaAlpha
        }
        
        if alpha < -swingAngle {
            alpha = -swingAngle
            deltaAlpha = -deltaAlpha
        }
        pendulum.transform = CGAffineTransform.init(rotationAngle: alpha)
    }


}

