//
//  CalendarCell.swift
//  BookingVP
//
//  Created by HoangVanDuc on 11/28/19.
//  Copyright © 2019 HoangVanDuc. All rights reserved.
//

import UIKit
import JTAppleCalendar
class CalendarCell: JTAppleCell {
    @IBOutlet weak var viewSelect: UIView!
    @IBOutlet weak var lbDay: UILabel!
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var ivSelect: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.viewSelect.layer.cornerRadius = self.viewSelect.frame.size.width/2
        self.lbDay.layer.cornerRadius = self.lbDay.frame.size.width/2
        self.background.layer.cornerRadius = self.background.frame.size.width/2
    }
}
