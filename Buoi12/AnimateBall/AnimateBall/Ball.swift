//
//  Ball.swift
//  AnimateBall
//
//  Created by Taof on 11/14/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class Ball: UIView {
    var circleLayer: CAShapeLayer!
    var radius: CGFloat = 0.0
    
    var fillColor: UIColor!
    
    convenience init(center: CGPoint, radius: CGFloat, fillColor: UIColor) {
        self.init(frame: CGRect(x: center.x - radius, y: center.y - radius, width: radius * 2.0, height: radius * 2.0))
        self.radius = radius
        self.fillColor = fillColor
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if circleLayer == nil {
            circleLayer = CAShapeLayer()
            circleLayer.path = UIBezierPath(ovalIn: CGRect(x: 0.0, y: 0.0,
                                                           width: self.frame.size.width,
                                                           height: self.frame.size.height)).cgPath
            
            circleLayer.fillColor = fillColor.cgColor
            self.layer.addSublayer(circleLayer)
            
            let lineLayer = CAShapeLayer()
            let path1 = UIBezierPath()
            path1.move(to: CGPoint(x: 0, y: self.frame.size.height/2 + 1))
            path1.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height/2 + 1))
            path1.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height/2 + 2))
            path1.addLine(to: CGPoint(x: 0, y: self.frame.size.height/2 + 2))
            lineLayer.path = path1.cgPath
            lineLayer.fillColor = UIColor.white.cgColor
            circleLayer.insertSublayer(lineLayer, at: 0)
        }
    }
    
}
