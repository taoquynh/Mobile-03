//
//  ViewController.swift
//  RandomImage
//
//  Created by Taof on 10/24/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var changeButton: UIButton!
    
    var imgNames: [String] = ["1", "2", "3"]
    var randomName: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomName = random()
        changeButton.setTitle("Đổi ảnh", for: .normal)
        photoImageView.image = UIImage(named: randomName)
        photoImageView.contentMode = .scaleAspectFit
    }

    @IBAction func onChange(_ sender: Any) {
        randomName = random()
        photoImageView.image = UIImage(named: randomName)
    }
    
    func random() -> String {
        var name = imgNames.randomElement()!
        if randomName == name{
            name = random()
        }
        
        return name
    }
}

