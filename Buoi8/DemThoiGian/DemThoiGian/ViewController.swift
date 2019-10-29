//
//  ViewController.swift
//  DemThoiGian
//
//  Created by Taof on 10/28/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

enum Time {
    case Start
    case Pause
}

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var restartButton: UIButton!
    
    var timer: Timer!
    var time: Int = 0
    
    var type: Time = Time.Start
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func initTimer(){
    timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
    }
    
    @IBAction func onStart(_ sender: UIButton) {
        if type == Time.Start{
            initTimer()
            startButton.setTitle("Pause", for: .normal)
            type = Time.Pause
        } else {
            startButton.setTitle("Start", for: .normal)
            type = Time.Start
            timer.invalidate()
        }
    }
    
    @objc func runTimer(){
        time += 1
        timeLabel.text = String(time)
    }
    
    @IBAction func onRestart(_ sender: Any) {
        time = 0
        timeLabel.text = String(time)
        timer.invalidate()
    }
}

