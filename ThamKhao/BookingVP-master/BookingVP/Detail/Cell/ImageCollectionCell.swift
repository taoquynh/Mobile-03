//
//  ImageCollectionCell.swift
//  BookingVP
//
//  Created by HoangVanDuc on 11/22/19.
//  Copyright © 2019 HoangVanDuc. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ImageCollectionCell: UICollectionViewCell {
    @IBOutlet weak var ivHotel: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func binUIImage(image: UIImage) {
        ivHotel.image = image
    }
}
