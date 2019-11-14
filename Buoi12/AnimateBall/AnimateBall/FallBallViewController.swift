//
//  FallBallViewController.swift
//  AnimateBall
//
//  Created by Taof on 11/14/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class FallBallViewController: UIViewController {
    
    var ball: Ball!
    var timer: Timer!
    let ball_y_origin: CGFloat = 100.0
    let a: CGFloat = 1.0
    var v: CGFloat = 0.0
    var y: CGFloat!
    let radius:CGFloat = 30.0
    var height: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        y = ball_y_origin
        height = view.bounds.height
        ball = Ball(center: CGPoint(x: view.bounds.midX, y: y),
                               radius: radius,
                               fillColor:  UIColor.red)
        view.addSubview(ball)
        timer = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(timerLoop), userInfo: nil, repeats: true)
    }
    
    @objc func timerLoop() {
        v = v + a
        y = y + v
        if y > height - 12 - radius{
            y = height - 12 - radius
            v = -v * 0.8
        }
        ball.center = CGPoint(x: ball.center.x, y: y)
    }
    
}
