//
//  RandomImageViewController.swift
//  GameRandom
//
//  Created by Taof on 10/24/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class RandomImageViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var chaneButton: UIButton!
    
    let imgNames: [String] = ["1", "2", "3"]
    var randomName: String = ""
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoImageView.backgroundColor = UIColor.yellow
        randomName = random()
        photoImageView.image = UIImage(named: randomName)
        
        // contentMode: set chế độ hiển thị ảnh
//        photoImageView.contentMode = UIView.ContentMode.scaleToFill
        photoImageView.contentMode = .scaleAspectFit // hay dùng cái này nhất
//        photoImageView.contentMode = .scaleAspectFill
//        photoImageView.contentMode = .redraw
    }
    
    @IBAction func onChange(_ sender: Any) {
        randomName = random()
        photoImageView.image = UIImage(named: randomName)
    }
    
    func random() -> String {
        // random tên ảnh và gán vào name
        var name: String = imgNames.randomElement()!
        
        // kiểm tra nếu tên ảnh vừa được random mà trùng với tên ảnh random trước đó thì gọi lại hàm random (tránh bị 2 lần lặp liên tiếp)
        if randomName == name {
            name = random()
        }
        
        return name
    }
    
}
