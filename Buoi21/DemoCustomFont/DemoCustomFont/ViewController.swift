//
//  ViewController.swift
//  DemoCustomFont
//
//  Created by Taof on 12/21/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var fontLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fontLabel.text = "Caveat"
        fontLabel.font = UIFont(name: "Caveat-Regular", size: 24)
//
//        guard let customFont = UIFont(name: "Caveat-Regular", size: 32) else {
//            fatalError("""
//                        Failed to load the "Caveat-Regular" font.
//                       """
//            )
//        }
//
//        fontLabel.font = UIFontMetrics.default.scaledFont(for: customFont)
        
//        for family: String in UIFont.familyNames
//        {
//            print(family)
//            for names: String in UIFont.fontNames(forFamilyName: family)
//            {
//                print("== \(names)")
//            }
//        }
    }
    
    
}

