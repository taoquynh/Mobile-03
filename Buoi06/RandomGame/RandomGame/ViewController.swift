//
//  ViewController.swift
//  RandomGame
//
//  Created by Taof on 10/24/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var reloadButton: UIButton!
    
    var random = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        random = Int.random(in: 0...100)
        print(random)
        reloadButton.frame.size = CGSize(width: 64, height: 64)
        reloadButton.setImage(UIImage(named: "ic_reload"), for: .normal)
        resultLabel.isHidden = true
        reloadButton.isHidden = true
    }

    @IBAction func checkButton(_ sender: UIButton) {
        guard let inputNumber = Int(inputTextField.text!) else {
            return
        }
        
        resultLabel.isHidden = false
        
        if inputNumber < random {
            resultLabel.text = "Bé quá"
        }else if inputNumber > random{
            resultLabel.text = "Lớn quá"
        }else{
            resultLabel.text = "Chính xác"
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

