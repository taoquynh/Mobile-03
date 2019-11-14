//
//  ViewController.swift
//  Caculator
//
//  Created by Taof on 11/14/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

enum Operation: String {
    case Divide = "/"
    case Multiply = "*"
    case Subtract = "-"
    case Add = "+"
    case Empty = "Empty"
}

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    var currentOperation = Operation.Empty // phép tính hiện tại
    var runningNumber = "" // lưu số được chọn
    var leftValStr = "" // lưu số bên trái biểu thức
    var rightValStr = "" // lưu số bên phải biểu thức
    
    var result: String = "" // lưu kết quả
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func clearButton(_ sender: UIButton) {
        processOperation(operation: Operation.Empty)
        runningNumber = ""
        result = ""
        leftValStr = ""
        rightValStr = ""
        resultLabel.text = "0"
    }
    
    @IBAction func equalButton(_ sender: UIButton) {
        processOperation(operation: currentOperation)
    }
    
    @IBAction func devideButton(_ sender: UIButton) {
        processOperation(operation: Operation.Divide)
    }
    
    @IBAction func multiButton(_ sender: UIButton) {
        processOperation(operation: Operation.Multiply)
    }
    
    @IBAction func subButton(_ sender: UIButton) {
        processOperation(operation: Operation.Subtract)
    }
    
    @IBAction func addButton(_ sender: UIButton) {
        processOperation(operation: .Add)
    }
    
    @IBAction func numberButton(_ sender: UIButton) {
        runningNumber += "\(sender.tag)"
        resultLabel.text = runningNumber
    }
    
    func processOperation(operation: Operation){
        if currentOperation != Operation.Empty{ // nếu có phép tính được chọn thì nhảy vào đây
            if runningNumber != "" { // nếu sau biểu thức là số thì nhảy vào đây
                rightValStr = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.Multiply {
                    result = "\(Double(leftValStr)! * Double(rightValStr)!)"
                } else if currentOperation == Operation.Divide {
                    result = "\(Double(leftValStr)! / Double(rightValStr)!)"
                } else if currentOperation == Operation.Subtract {
                    result = "\(Double(leftValStr)! - Double(rightValStr)!)"
                } else if currentOperation == Operation.Add {
                    result = "\(Double(leftValStr)! + Double(rightValStr)!)"
                }
                
                leftValStr = result
                resultLabel.text = result
            }
        }else{ // nếu không có phép tính được chọn thì nhảy vào đây
            leftValStr = runningNumber
            runningNumber = ""
        }
        currentOperation = operation
    }
}

