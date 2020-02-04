//
//  CalendarCollectionViewCell.swift
//  CalendarExample
//
//  Created by Taof on 6/12/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit
import FSCalendar

class CalendarCollectionViewCell: FSCalendarCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init!(frame: CGRect) {
        super.init(frame: frame)
        
//        self.backgroundColor = UIColor.yellow
//        self.backgroundView?.frame = self.bounds.insetBy(dx: 1, dy: 1)
    }
    
    required init!(coder aDecoder: NSCoder!) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
