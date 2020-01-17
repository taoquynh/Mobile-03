//
//  ZoomImageView.swift
//  DemoCollectionView
//
//  Created by Taof on 1/16/20.
//  Copyright © 2020 Taof. All rights reserved.
//

import UIKit

class ZoomImageView: ViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    var image: UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()

        photoImageView.image = image
    }


}
