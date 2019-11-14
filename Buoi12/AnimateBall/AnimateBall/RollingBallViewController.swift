//
//  RollingBallViewController.swift
//  AnimateBall
//
//  Created by Taof on 11/14/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class RollingBallViewController: UIViewController {

    var ball: Ball!
    let radius: CGFloat = 30.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ball = Ball(center: CGPoint(x: radius, y: view.frame.size.height - radius),
        radius: radius,
        fillColor:  UIColor.red)
        view.addSubview(ball)
        
        UIView.animate(withDuration: 2, animations: {
            self.ball.frame.origin.x += UIScreen.main.bounds.width - self.ball.frame.width
            UIView.animate(withDuration: 2.0, animations: {
                self.ball.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
            })
        }) {_ in
            UIView.animateKeyframes(withDuration: 2, delay: 0.2, options: [.autoreverse, .repeat], animations: {
                self.ball.frame.origin.x -= UIScreen.main.bounds.width - self.ball.frame.width
                // identity để loại bỏ transform cũ
                self.ball.transform = CGAffineTransform.identity
            })
        }
    }
    

}
