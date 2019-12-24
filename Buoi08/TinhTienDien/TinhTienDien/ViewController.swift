//
//  ViewController.swift
//  TinhTienDien
//
//  Created by Taof on 10/28/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var outLabel: UILabel!
    
    @IBOutlet weak var inTextField: UITextField!
    
    @IBOutlet weak var outButton: UIButton!
    var n:Int = 0
    var price = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inTextField.keyboardType = .numberPad
        outLabel.layer.cornerRadius = 20.0
        outLabel.layer.masksToBounds = true
        
        outButton.layer.cornerRadius = 20.0
        
        
    }
    
    @IBAction func calButton(_ sender: Any) {
        
        n = Int(inTextField.text!)!
        if n > 400
        {
            price = (1678+1734)*50 + (2014+2536+2834)*100 + (n-400)*2927
        }
        else if n > 300
        {
            price = (1678+1734)*50 +
            (2014+2536)*100 + (n-300)*2834
        }
        else if n > 200
        {
            price = (1678+1734)*50 + 2014*100 + (n-200)*2536
        }
        else if n > 100
        {
            price = (1678+1734)*50 + (n-100)*2536
        }
        else if n > 50{
            price = 1678*50 + (n-50)*1734
        }
        else if n >= 1{
            price = 1678*n
        }
        else{
            price = -1
        }
        outLabel.text = "Price = \(110 * price / 100)"
    }
    

}

