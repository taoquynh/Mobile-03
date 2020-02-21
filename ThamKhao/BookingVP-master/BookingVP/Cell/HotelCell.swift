//
//  HotelCell.swift
//  BookingVinPearl
//
//  Created by HoangVanDuc on 11/21/19.
//  Copyright © 2019 HoangVanDuc. All rights reserved.
//

import UIKit

class HotelCell: UITableViewCell {
    @IBOutlet weak var lbDistance: UILabel!
    @IBOutlet weak var lbPrice: UILabel!
    @IBOutlet weak var lbHotelName: UILabel!
    @IBOutlet weak var ivHotel: UIImageView!
    @IBOutlet weak var viewHotel: UIView!
    @IBOutlet weak var lbAddress: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewHotel.layer.cornerRadius = 8
        viewHotel.layer.borderWidth = 0.5
        viewHotel.layer.borderColor = UIColor.lightGray.cgColor
        viewHotel.clipsToBounds = true
        lbPrice.textColor = UIColor.textGreen
        lbDistance.textColor = UIColor.textWhite
        lbHotelName.textColor = UIColor.textWhite
        lbAddress.textColor = UIColor.textWhite
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
