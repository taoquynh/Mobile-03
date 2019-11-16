//
//  ViewController.swift
//  DongHo
//
//  Created by Taof on 11/14/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let currentDate = NSDate()
    let calendar = NSCalendar.current
    
    @IBOutlet weak var kimGioView: UIView!
    @IBOutlet weak var kimPhutView: UIView!
    @IBOutlet weak var kimGiayView: UIView!
    @IBOutlet weak var clockView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        getLocation(kimView: kimGioView, alpha: 60)
    }
    
    func setUI(){
        kimGioView.frame.size = CGSize(width: clockView.bounds.size.width/10 * 2.5, height: 6)
        kimGioView.center = clockView.center
        
        kimPhutView.frame.size = CGSize(width: clockView.bounds.size.width/10 * 3, height: 4)
        kimPhutView.center = clockView.center
        
        kimGiayView.frame.size = CGSize(width: clockView.bounds.size.width/10 * 3.5, height: 2)
        kimGiayView.center = clockView.center
    }

    func setAnchorPoint(kimView: UIView, point: CGPoint){
        kimView.layer.anchorPoint = point
    }
    
    func getLocation(kimView: UIView, alpha: CGFloat){
        let r = kimView.bounds.size.height/2
        kimView.layer.cornerRadius = r // bo viền
        
        setAnchorPoint(kimView: kimView, point: CGPoint(x: 0, y: 0.5))
        kimView.transform = CGAffineTransform(rotationAngle: alpha)
    }
    
    func setTimer() -> (hour: CGFloat, minute: CGFloat, second: CGFloat){
        let hour = calendar.component(.hour, from: currentDate as Date)
        let minute = calendar.component(.minute, from: currentDate as Date)
        let second = calendar.component(.second, from: currentDate as Date)
        
        return (0,0,0)
    }
}

