//
//  PlusButton.swift
//  DrawBrick
//
//  Created by Taof on 11/2/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

// IB: Interface builder
// @IBDesignable để update giao diện
@IBDesignable
class PlusButton: UIButton {

    // một cách khai báo biến, private là biến này sử dụng nội bộ, từ bên ngoài không gọi được
    private var halfWidth: CGFloat {
        return bounds.width / 2
    }

    private var halfHight: CGFloat {
        return bounds.height / 2
    }
    
    let plusButtonScale: CGFloat = 0.6
    
    // @IBInspectable, có cái này, thì biến này sẽ được thay đổi ở cột inspector
    @IBInspectable var plusLineWidth: CGFloat = 5.0
    @IBInspectable var fillColor: UIColor = UIColor.green
    @IBInspectable var isAddButton: Bool = false
    
    override func draw(_ rect: CGRect) {
        // vẽ hình oval
        let path = UIBezierPath(ovalIn: rect)
        fillColor.setFill()
        path.fill()
        
        //thiết lập biến chiều rộng và chiều cao cho nét (stroke) ngang
        // so sánh chiều rộng và chiều cao của button, lấy giá trị nhỏ hơn sau đó nhân với tỉ lệ
        let plusWidth: CGFloat = min(bounds.width, bounds.height) * plusButtonScale
        let halfPlusWidth = plusWidth / 2

        //create the path: tạo đường dẫn
        let plusPath = UIBezierPath()

        // đặt độ rộng và độ cao cho đường dẫn (đường line)
        plusPath.lineWidth = plusLineWidth

        // dịch chuyển điểm ban đầu của đường dẫn
        // bắt đầu vẽ nét ngang
        plusPath.move(to: CGPoint(x: halfWidth - halfPlusWidth, y: halfHight))

        //thêm một điểm vào đường dẫn ở cuối nét
        plusPath.addLine(to: CGPoint(x: halfWidth + halfPlusWidth, y: halfHight))
        
        if isAddButton {
            plusPath.move(to: CGPoint(x: halfWidth, y: halfHight - halfPlusWidth))
            plusPath.addLine(to: CGPoint(x: halfWidth, y: halfHight + halfPlusWidth))
        }
        
        // đặt màu cho stroke()
        UIColor.white.setStroke()
        plusPath.stroke()
    }
}
