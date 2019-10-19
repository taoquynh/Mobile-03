//
//  ViewController.swift
//  BatDen
//
//  Created by Taof on 10/19/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var bulbImageView: UIImageView!
    @IBOutlet weak var bulbButton: UIButton!
    
    var isCheck: Bool = false
    
    var state: [Bool: [String]] = [
        true: ["BulbOn", "Tắt đèn"],
        false: ["BulbOff", "Bật đèn"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // dù khi khai báo biến isCheck có giá trị là gì, thì mình có thể set lại giá trị ban đầu cho nó tại viewDidLoad()
        isCheck = true
        print("Trạng thái ban đầu: \(isCheck)")
        kiemTra(check: isCheck)
//        kiemTra2()
        
        // bo viền cho nút
        bulbButton.layer.cornerRadius = 10.0
    }
    
    @IBAction func onPress(_ sender: Any) {
        // Trạng thái trước khi đổi giá trị isCheck
        print("Trạng thái trước khi đổi giá trị isCheck: \(isCheck)")
        isCheck = !isCheck
        print("Trạng thái sau khi đổi giá trị isCheck: \(isCheck)")
        kiemTra(check: isCheck)
//        kiemTra2()
    }
    
//    func kiemTra2(){
//        bulbImageView.image = UIImage(named: state[isCheck]![0])
//        bulbButton.setTitle(state[isCheck]![1], for: .normal)
//    }
    
    func kiemTra(check: Bool){
        // kiểm tra nếu check là true thì nhảy vào scope if, ngược lại thì nhảy vào scope else
        if check {
            bulbImageView.image = UIImage(named: "BulbOff")
            bulbButton.setTitle("Bật đèn", for: .normal)
        } else{
            bulbImageView.image = UIImage(named: "BulbOn")
            bulbButton.setTitle("Tắt đèn", for: .normal)
        }
    }
    

}

