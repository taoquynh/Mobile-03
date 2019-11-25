//
//  CircleView.swift
//  ChuaBTAutoLayout
//
//  Created by Taof on 11/23/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

@IBDesignable
class CircleView: UIView {

    @IBInspectable var radius: CGFloat = 0.0
    @IBInspectable var fillColor: UIColor = .red
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(roundedRect: rect, cornerRadius: radius)
        fillColor.setFill()
        path.fill()
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        self.layer.addSublayer(shapeLayer)
        self.layer.mask = shapeLayer
        
    }
}
