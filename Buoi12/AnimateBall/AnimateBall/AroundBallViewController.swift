//
//  AroundBallViewController.swift
//  AnimateBall
//
//  Created by Taof on 11/14/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class AroundBallViewController: UIViewController {
    
    var ball: Ball!
    let radius: CGFloat = 30.0
    
    var BienX: CGFloat = 0
    var BienY: CGFloat = 0
    var timer = Timer()
    var bientam = false
    var bientamy = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ball = Ball(center: CGPoint(x: radius, y: radius),
                    radius: radius,
                    fillColor:  UIColor.red)
        view.addSubview(ball)
        
        BienX = self.ball.frame.origin.x
        BienY = self.ball.frame.origin.y
        
        runTimer()
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self,   selector: (#selector(runningFunction)), userInfo: nil, repeats: true)
    }
    
    @objc func runningFunction(){
        let r = 2 * radius
        // Neu vi tri hien tai nho hon max
        if(BienX < (self.view.bounds.width - r) && bientam == false){
            setX(x:BienX)
            BienX = BienX + 1
        }else{ // x = max roi thi di chuyen y neu y < max
            if(BienY<(self.view.bounds.height - r) && bientamy == false){
                setY(y:BienY)
                BienY = BienY + 1
            }else{// y = max roi giam x di chuyen x -> 0
                bientamy = true
                if(BienX > 0){
                    bientam = true
                    setX(x:BienX)
                    BienX = BienX - 1
                }
                else{
                    if(BienY > 0){
                        setY(y:BienY)
                        BienY = BienY - 1
                    }else{
                        bientam = false
                        bientamy = false
                    }
                }
            }
        }
    }
    func setX(x:CGFloat) {
        self.ball.frame.origin.x = x
    }
    
    func setY(y:CGFloat) {
        self.ball.frame.origin.y = y
    }
}
