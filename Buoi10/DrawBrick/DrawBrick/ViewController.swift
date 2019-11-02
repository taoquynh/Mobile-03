//
//  ViewController.swift
//  DrawBrick
//
//  Created by Taof on 11/2/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    let radius: CGFloat = 100
    var containerView = UIView()
    var width: CGFloat = 0
    var squareWidth: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        width = self.view.frame.width
        containerView.frame = CGRect(x: 0, y: 0, width: width/2, height: width/2)
        containerView.center = view.center
        containerView.backgroundColor = UIColor.lightGray
        view.addSubview(containerView)
        
        squareWidth = (containerView.bounds.width) / 6
        //drawWall()
//        drawI()
        drawO()
    }
    
    func drawBrick(row: Int, col: Int, radius: CGFloat, color: UIColor) {
        let d = radius * 2
        let ball = Brick(startPoint: CGPoint(x: d * CGFloat(col), y: d * CGFloat(row)), radius: radius, fillColor: color)
        containerView.addSubview(ball)
    }

    func drawWall(){
        for i in 0...2{
            for j in 0...2 {
                drawBrick(row: i, col: j, radius: squareWidth, color: UIColor.purple)
            }
        }
    }
    
    func drawI(){
        for i in 0...2{
            for j in 0...2{
                if j == 1{
                    drawBrick(row: i, col: j, radius: squareWidth, color: UIColor.systemPink)
            
                }
            }
        }
    }
    func drawO(){
        for i in 0...1{
            for j in 0...1{
                
                drawBrick(row: i, col: j, radius: squareWidth, color: UIColor.blue)
            }
        }
    }

}

