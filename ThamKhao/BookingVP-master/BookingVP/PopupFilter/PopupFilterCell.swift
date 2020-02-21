//
//  PopupFilterCell.swift
//  BookingVP
//
//  Created by HoangVanDuc on 11/22/19.
//  Copyright © 2019 HoangVanDuc. All rights reserved.
//

import UIKit

class PopupFilterCell: UITableViewCell {
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var ivSelected: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
