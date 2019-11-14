//
//  ZigZagViewController.swift
//  AnimateBall
//
//  Created by Taof on 11/14/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit
enum Direction {
    case right
    case down
    case left
}

class ZigZagViewController: UIViewController {
    
    var ball: Ball!
    let radius: CGFloat = 30.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ball = Ball(center: CGPoint(x: radius, y: radius),
                    radius: radius,
                    fillColor:  UIColor.red)
        view.addSubview(ball)
        zigzag(direction: .right)
    }
    
    func zigzag(direction: Direction) {
        switch direction {
        case .right:
            // kiểm tra: nếu toạ độ y của quả bóng lớn hơn chiều cao của view (thiết bị) thì gọi đến transform identity, CGAffineTransform.indentity sẽ xoá mọi ràng buộc thay đổi của quả bóng và đặt về mặc định
            if self.ball.frame.origin.y > self.view.frame.size.height {
                self.ball.transform = CGAffineTransform.identity
            }
            
            // dịch chuyển từ điểm bắt đầu sang phải,
            UIView.animate(withDuration: 2, animations: {
                self.ball.transform = CGAffineTransform(translationX: self.view.frame.size.width - self.ball.frame.width, y: self.ball.frame.origin.y - 20)
            }) { (_) in
                self.zigzag(direction: .down)
            }
            break
        case .down:
            // nếu quả bóng đang đứng bên phải thì dịch bóng từ trên xuống và giữ toạ độ x ở mép bên phải ( = self.view.frame.size.width - self.ballImage.frame.width)
            // nếu quả bóng đang đứng bên trái thì dịch bóng từ trên xuống và giữ toạ độ x ở mép trái ( =0)
            UIView.animate(withDuration: 2, animations: {
                if self.ball.frame.origin.x != 0.0 {
                    self.ball.transform = CGAffineTransform(translationX: self.view.frame.size.width - self.ball.frame.width, y: self.ball.frame.origin.y + self.view.frame.height/5)
                } else {
                    self.ball.transform = CGAffineTransform(translationX: 0, y: self.ball.frame.origin.y + self.view.frame.height/5)
                }
            }) { (_) in
                // nếu quả bóng đang đứng bên trái thì dịch nó sang phải và ngược lại
                if self.ball.frame.origin.x == 0.0 {
                    self.zigzag(direction: .right)
                } else {
                    self.zigzag(direction: .left)
                }
            }
            break
        case .left:
            // dịch chuyển từ phải sang trái
            UIView.animate(withDuration: 2, animations: {
                self.ball.transform = CGAffineTransform(translationX: 0, y: self.ball.frame.origin.y - 20)
            }) { (_) in
                self.zigzag(direction: .down)
            }
            break
        }
    }
    
}
