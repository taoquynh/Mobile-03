//
//  ViewController.swift
//  EightQueens
//
//  Created by Tào Quỳnh on 6/1/19.
//  Copyright © 2019 Tào Quỳnh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Khai báo kích thước bàn cờ, để đặt được ví trí các quân hậu thì kích thước bàn cờ phải từ 4x4 trở lên
    // Ở đây, chúng ta khai báo bàn cờ kích thước nxn (nmax = 8)
    let n = 8 // kích thước bàn cờ
    
    var screenWidth: CGFloat = 0 // chiều rộng màn hình
    var screenHeight: CGFloat = 0 // chiều cao màn hình
    var squareWidth: CGFloat = 0 // chiều rộng một ô bàn cờ
    var squareHeight: CGFloat = 0 // chiều cao một ô bàn cờ
    var margin: CGFloat = 30.0 // khoảng cách cách nhau
    
    var images: [UIImageView] = [] // mảng images để lưu tập hợp ảnh queen cho mỗi trường hợp
    
    // mảng arrays để lưu bộ vị trí thoả mãn của mỗi trường hợp,
    var arrays = Array(repeating: 0, count: 9)
    
    // mảng queens chứa các trường hợp có thể đặt n quân hậu trên bàn cờ
    var queens = [[Queen]]()
    
    var index = 0
    var total = 0 // tổng tất cả các trường hợp tìm được
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupControl()
        putQueen(row: 1)
        total = queens.count
        print(total)
//        placeQueen(isHas: true, row: 0, col: 0)
        gestureWithChessBoard()
        
        // duyệt 92 kết quả từ mảng queens (queens là mảng 2 chiều)
//        for item in queens{
//            for i in item {
//                print("(\(i.row), \(i.col)) ", terminator: "")
//            }
//            print()
//        }
    }
    
    // vẽ bàn cờ
    func setupControl() {
        screenWidth = self.view.bounds.width
        screenHeight = self.view.bounds.height
        squareWidth = (self.view.bounds.width - margin*2) / CGFloat(n)
        self.view.backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
        
        for row in 0..<n {
            for col in 0..<n {
                let isWhiteSquare = (row + col)%2 == 1 ? true: false
                drawSquare(isWhite: isWhiteSquare, width: squareWidth, row: row, col: col)
            }
        }
    }
    
    // vẽ ô bàn cờ
    func drawSquare(isWhite: Bool, width: CGFloat, row: Int, col: Int) {
        func computePositionOfSquare(row: Int, col: Int, squareWidth: CGFloat) -> CGRect {
            return CGRect(x: margin + CGFloat(col)*squareWidth, y: 64 + margin + CGFloat(row)*squareWidth, width: squareWidth, height: squareWidth)
        }
        
        let square = UIView(frame: computePositionOfSquare(row: row, col: col, squareWidth: width))
        square.backgroundColor = isWhite ? UIColor.white: UIColor.black
        self.view.addSubview(square)
    }
    
    // vị trí đặt cờ
    func placeQueen(isHas: Bool, row: Int, col: Int) {
        let queen = UIImageView(image: UIImage(named: "queen"))
        if isHas {
            print(squareWidth)
            queen.frame = CGRect(x: margin + CGFloat(col)*squareWidth, y: 64 + margin + CGFloat(row)*squareWidth, width: squareWidth, height: squareWidth)
            queen.contentMode = .scaleAspectFit
            images.append(queen)
            self.view.addSubview(queen)
        }
    }

    // đi đặt quân hậu vào từng vị trí,
    func putQueen(row: Int){
        // đi lần lượt các cột từ 1 đến n
        for col in 1...n{
            // ở mỗi cột thì kiểm tra các hàng,
            if isSafe(row: row, col: col){
                // nếu toạ độ hàng và cột thoả mãn thì lưu lại toạ độ đó
                arrays[row] = col
                if row == n {
                    // nếu đã duyệt hết hàng thì lưu lại kết quả đặt hậu
                    saveResult()
                }
                // sau khi lưu lại toạ độ thì sử dụng đệ quy gọi lại chính nó kiểm tra hàng tiếp theo
                putQueen(row: row+1)
            }
            // nếu toạ độ hàng cột không thoả mãn thì thực hiện vòng lặp tiếp theo
        }
    }
    
    // kiểm tra vị trí quân hậu đang đứng có an toàn không
    func isSafe(row: Int, col: Int) -> Bool {
        for i in 1..<row {
            // hàm abs là lấy trị tuyệt đối
            // nếu quân hậu đang kiểm tra nằm trên cột hoặc đường chéo chứa quân hậu khác thì return false
            if arrays[i] == col || abs(i-row) == abs(arrays[i]-col) {
                return false
            }
        }
        return true
    }

    // lưu kết quả 8 quân hậu vào mảng queens
    func saveResult(){
        var objects = [Queen]()
        var row = 1
        for col in 1...n {
            objects.append(Queen(row: row, col: arrays[col]))
            row += 1
        }
        
        queens.append(objects)
    }
    
    // hàm xử lý cử chỉ (thao tác, hành động) với đối tượng bàn cờ
    func gestureWithChessBoard(){
        // hành động vuốt trên điện thoại được gọi là swipe
        // có 4 hướng vuốt là trái, phải, trên, dưới
        // ở đây chúng ta đề cập đến vuốt trái, phải màn hình
        
        // Khai báo một biến swipeRight kiểu UISwipeGestureRecognizer để nhận dạng hành động vuốt
        let swipeRight = UISwipeGestureRecognizer(target: self, action:#selector(swiped))
        // Xác định hướng vuốt
        swipeRight.direction = .right
        // view.addGestureRecognizer để xác định hành động swipeRight sử dụng cho đối tượng view
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action:#selector(swiped))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    @objc func swiped(gesture: UIGestureRecognizer) {
        // if let để kiểm tra nếu có hành động vuốt thì sẽ gán nó bằng biến swipeGesture và xử lý hành động bên trong
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            // kiểm tra hướng vuốt để xác định xử lý
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.right:
                swipeRight()
            case UISwipeGestureRecognizer.Direction.left:
                swipeLeft()
            default:
                break
            }
        }
    }
    
    func swipeRight() {
        print("swipe right")
        // xoá các con hậu đang nằm trên bàn cờ nếu có
        for image in images{
            image.removeFromSuperview()
        }
        
        index = index - 1
        if index < 0 {
            index = 0
        }
        
        if index > 0 && index < total{
            for i in queens[index]{
                placeQueen(isHas: true, row: i.row-1, col: i.col-1)
            }
        }
    }
    
    func swipeLeft() {
        print("swipe left")
        for image in images{
            image.removeFromSuperview()
        }
        index = index + 1
        if index > total {
            index = total
        }
        
        if index > 0 && index < total{
            for i in queens[index]{
                placeQueen(isHas: true, row: i.row-1, col: i.col-1)
            }
        }
    }
    
}

