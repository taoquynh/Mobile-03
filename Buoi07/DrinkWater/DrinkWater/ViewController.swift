//
//  ViewController.swift
//  DrinkWater
//
//  Created by Taof on 10/26/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var waterView: UIView!
    @IBOutlet weak var countLabel: UILabel!
    
    // khai báo biến timer kiểu Timer
    var timer: Timer!
    
    // khai báo biến n
    var n = 15
    
    // khai báo biến đếm
    var count = 0
    
    // khai báo một biến soundPlayer
    var soundPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // khởi tạo timer
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true) // nếu repeat là true thì hàm runTimer được gọi lặp lại, ngược lại nếu repeat là false thì hàm runTimer chỉ được gọi một lần
        
        countLabel.text = String(n)
        count = n
        playSound()
    }

    // hàm kế thừa objc, phải có @objc ở trước từ khoá khai báo hàm
    @objc func runTimer(){
        print("runloop")
        count -= 1
        countLabel.text = String(count)
        if count < 1 {
            soundPlayer?.pause()
            timer.invalidate()
        }
        
        waterView.frame = CGRect(x: 0, y: waterView.frame.origin.y + waterView.frame.size.height/CGFloat(n), width: waterView.frame.size.width, height: waterView.frame.size.height)
    }

    func playSound(){
        let path = Bundle.main.path(forResource: "bubblewater.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)

        do {
            soundPlayer = try AVAudioPlayer(contentsOf: url)
            soundPlayer?.play()
            // đặt numberOfLoops = -1 để nó chạy lại khi chạy hết
            soundPlayer?.numberOfLoops = -1
        } catch {
            print("lỗi")
            // couldn't load file :(
        }
    }
}

