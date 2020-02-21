//
//  EmptyTableViewCell.swift
//  BookingVP
//
//  Created by HoangVanDuc on 11/26/19.
//  Copyright © 2019 HoangVanDuc. All rights reserved.
//

import UIKit

class EmptyTableViewCell: UITableViewCell {
    @IBOutlet weak var cstHeightViewEmpty: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cstHeightViewEmpty.constant = 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
