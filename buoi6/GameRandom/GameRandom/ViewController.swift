//
//  ViewController.swift
//  GameRandom
//
//  Created by Taof on 10/24/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var reloadButton: UIButton!
    
    var random: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        random = Int.random(in: 0...100)
        print(random)
        
        // isHidden = true: ẩn một đối tượng
        resultLabel.isHidden = true
//        reloadButton.isHidden = true
        
        // đặt thuộc tính keyboard cho TextField
        inputTextField.keyboardType = .numberPad
        
        reloadButton.setImage(UIImage(named: "ic_reload"), for: .normal)
        
        // set lại title của button là rỗng
        reloadButton.setTitle("", for: .normal)
//        reloadButton.isHighlighted = true
        // đặt lại kích thước của button
        reloadButton.frame.size = CGSize(width: 64, height: 64)
    }

    @IBAction func onCheck(_ sender: Any) {
        // kiểm tra nếu textField có giá trị và có thể ép về Int thì gán lại vào number,
        guard let number = Int(inputTextField.text!) else {
            return
        }
        
        resultLabel.isHidden = false
        if number < random {
            resultLabel.text = "Bé quá!"
        } else if number > random {
            resultLabel.text = "Lớn quá!"
        } else {
            resultLabel.text = "Chúc mừng!"
            reloadButton.isHidden = false
        }
        
    }
    
    @IBAction func onReload(_ sender: Any) {
        inputTextField.text = ""
        resultLabel.isHidden = true
        reloadButton.isHidden = true
        random = Int.random(in: 0...100)
    }
    
}

