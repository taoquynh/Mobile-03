//
//  ViewController.swift
//  DemoUIView
//
//  Created by Taof on 10/26/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    
    @IBOutlet weak var widthSlider: UISlider!
    @IBOutlet weak var rotateSlide: UISlider!
    @IBOutlet weak var radiusSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(myView.frame)
    }

    @IBAction func onChangeWidth(_ sender: UISlider) {
        print(myView.frame)
        myView.transform = CGAffineTransform(scaleX: CGFloat(widthSlider.value) * 2, y: CGFloat(widthSlider.value) * 2)
    }
    
    @IBAction func onChangeRotate(_ sender: UISlider) {
        print(myView.frame)
        myView.transform = CGAffineTransform(rotationAngle: CGFloat(rotateSlide.value) * CGFloat.pi)
    }
    
    @IBAction func onChangeRadius(_ sender: UISlider) {
        print(myView.frame)
        // bo tròn view: myView.frame.width/2
//        myView.layer.cornerRadius = myView.frame.size.width/2 * CGFloat(radiusSlider.value)
        
        myView.layer.cornerRadius = myView.bounds.width/2 * CGFloat(radiusSlider.value)
        
    }
    
}
