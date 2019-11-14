//
//  ViewController.swift
//  Ball
//
//  Created by Taof on 11/7/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var ball: CircleLayerView!
    let radius: CGFloat = 50.0
    var y: CGFloat = 100.0
    let startY: CGFloat = 100.0
    var ball_origin_y: CGFloat = 0
    
    // khai báo 1 biến timer
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ball = CircleLayerView(center: CGPoint(x: view.bounds.midX, y: startY),
                               radius: radius,
                               fillColor:  UIColor.red)
        view.addSubview(ball)
//        dropBall4()
        
        // khởi tạo timer
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
    }
    
    @objc func runTimer(){
        dropBall5()
    }
    
    func dropBall5(){
        
        if self.ball.frame.origin.y >= view.frame.height - self.ball.bounds.height - 20 {
            timer.invalidate()
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(runBack), userInfo: nil, repeats: true)
        }
        self.ball.frame.origin.y += 5
        print(self.ball.frame.origin.y)
    }
    
    @objc func runBack(){
        if self.ball.frame.origin.y <= startY {
            timer.invalidate()
            
        }
        self.ball.frame.origin.y -= 5
        print(self.ball.frame.origin.y)
    }
    
    func dropBall1(){
        UIView.animate(withDuration: 2) {
            self.ball.frame.origin.y = self.view.frame.maxY - self.radius*2
        }
    }
    
    func dropBall2(){
        ball_origin_y = ball.frame.origin.y
        UIView.animate(withDuration: 2) {
            self.ball.frame.origin.y = self.ball.frame.origin.y + self.view.bounds.height - self.ball_origin_y - self.ball.bounds.height
            
            //            self.ball.frame.origin.y += self.view.bounds.height - self.ball_origin_y - self.ball.bounds.height
        }
    }
    
    func dropBall3(){
        // bóng rơi từ độ cao y và nảy lên vị trí ban đầu
        ball_origin_y = ball.frame.origin.y
        UIView.animate(withDuration: 2, animations: {
            self.ball.frame.origin.y += self.view.bounds.height - self.ball_origin_y - self.ball.bounds.height
        }) { _ in
            UIView.animate(withDuration: 2, delay: 0.5, options: [], animations: {
                self.ball.frame.origin.y -= self.view.bounds.height - self.ball_origin_y - self.ball.bounds.height
            })
        }
    }
    
    func dropBall4(){
        UIView.animate(withDuration: 2, animations: {
            self.ball.center.y = 100
        }) { (_) in
            self.ball.center.y = self.view.frame.maxY - self.radius*2
        }
    }
    
}

