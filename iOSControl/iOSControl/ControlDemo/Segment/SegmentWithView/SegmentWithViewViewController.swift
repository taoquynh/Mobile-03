//
//  SegmentWithViewViewController.swift
//  iOSControl
//
//  Created by Tào Quỳnh on 4/4/19.
//  Copyright © 2019 Tào Quỳnh . All rights reserved.
//

import UIKit

class SegmentWithViewViewController: UIViewController {

    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var pinkView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        segment.selectedSegmentIndex = 0
        greenView.isHidden = false
        pinkView.isHidden = true
    }

    @IBAction func segmentTab(_ sender: Any) {
        if segment.selectedSegmentIndex == 0 {
            pinkView.isHidden = true
            greenView.isHidden = false
        }else{
            greenView.isHidden = true
            pinkView.isHidden = false
        }
    }
    
}
