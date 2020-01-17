//
//  SegmentCode.swift
//  iOSControl
//
//  Created by Taof on 10/14/19.
//  Copyright © 2019 Tào Quỳnh . All rights reserved.
//

import UIKit

class SegmentCode: UIViewController {
    
    override func viewDidLoad(){
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .white
        let mySegmentedControl = UISegmentedControl (items: ["One","Two","Three"])
        
        let xPostion:CGFloat = 10
        let yPostion:CGFloat = 150
        let elementWidth:CGFloat = 300
        let elementHeight:CGFloat = 30
        
        mySegmentedControl.frame = CGRect(x: xPostion, y: yPostion, width: elementWidth, height: elementHeight)
        mySegmentedControl.center.x = view.center.x
        
        // Make second segment selected
        mySegmentedControl.selectedSegmentIndex = 1
        
        //Change text color of UISegmentedControl
        mySegmentedControl.tintColor = UIColor.yellow
        
        //Change UISegmentedControl background colour
        mySegmentedControl.backgroundColor = UIColor.red
        
        // Add function to handle Value Changed events
        mySegmentedControl.addTarget(self, action: #selector(segmentedValueChanged(_:)), for: .valueChanged)
        
        self.view.addSubview(mySegmentedControl)
    }
    
    @objc func segmentedValueChanged(_ sender:UISegmentedControl!){
        print("Selected Segment Index is : \(sender.selectedSegmentIndex)")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
