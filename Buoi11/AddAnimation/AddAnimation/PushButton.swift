//
//  PushButton.swift
//  AddAnimation
//
//  Created by Tào Quỳnh  on 8/1/18.
//  Copyright © 2018 Tào Quỳnh . All rights reserved.
//

import UIKit

@IBDesignable
class PushButton: UIButton {

    private struct Constants {
        static let plusLineWidth: CGFloat = 10.0
        static let plusButtonScale: CGFloat = 0.6
        static let halfPointShift: CGFloat = 0.5
    }
    
    private var halfWidth: CGFloat {
        return bounds.width / 2
    }
    
    
    private var halfHight: CGFloat {
        return bounds.height / 2
    }
    
    @IBInspectable var fillColor: UIColor = UIColor.green
    @IBInspectable var isAddButton: Bool = true
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        fillColor.setFill()
        path.fill()
        
        //set up the width and height variables: thiết lập biến chiều rộng và chiều cao
        //for the horizontal stroke
        let plusWidth: CGFloat = min(bounds.width, bounds.height) * Constants.plusButtonScale
        let halfPlusWidth = plusWidth / 2
        
        //create the path: tạo đường dẫn
        let plusPath = UIBezierPath()
        
        //set the path's line width to the height of the stroke: đặt độ rộng và độ cao cho đường dẫn
        plusPath.lineWidth = Constants.plusLineWidth
        
        //move the initial point of the path: dịch chuyển điểm ban đầu của đường dẫn
        //to the start of the horizontal stroke: bắt đầu nét ngang
        plusPath.move(to: CGPoint(
            x: halfWidth - halfPlusWidth + Constants.halfPointShift,
            y: halfHight + Constants.halfPointShift))
        
        //add a point to the path at the end of the stroke: thêm một điểm vào đường dẫn ở cuối
        //Vertical Line: Đường thẳng đứng
        plusPath.addLine(to: CGPoint(
            x: halfWidth + halfPlusWidth + Constants.halfPointShift,
            y: halfHight + Constants.halfPointShift))
        
        if isAddButton {
            plusPath.move(to: CGPoint(
                x: halfWidth + Constants.halfPointShift,
                y: halfHight - halfPlusWidth + Constants.halfPointShift))
            
            plusPath.addLine(to: CGPoint(
                x: halfWidth + Constants.halfPointShift,
                y: halfHight + halfPlusWidth + Constants.halfPointShift))
        }
        //existing code
        //set the stroke color: đặt màu nét
        UIColor.white.setStroke()
        plusPath.stroke()
    }
    
}
