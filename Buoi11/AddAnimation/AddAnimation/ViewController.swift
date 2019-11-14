//
//  ViewController.swift
//  AddAnimation
//
//  Created by Tào Quỳnh  on 8/1/18.
//  Copyright © 2018 Tào Quỳnh . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var counterView: CounterView!
    
    @IBOutlet weak var counterLabel: UILabel!
    
    @IBAction func pressPushButton(_ button: PushButton) {
        
        if button.isAddButton {
            counterView.counter += 1
        } else {
            if counterView.counter > 0 {
                counterView.counter -= 1
            }
        }
        counterLabel.text = String(counterView.counter)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counterLabel.text = String(counterView.counter)
        counterLabel.layer.cornerRadius = counterLabel.frame.width/2
        
    }


}

