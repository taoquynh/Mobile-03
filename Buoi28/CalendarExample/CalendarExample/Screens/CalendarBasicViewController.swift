//
//  CalendarBasicViewController.swift
//  CalendarExample
//
//  Created by Taof on 6/12/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit
import FSCalendar

class CalendarBasicViewController: UIViewController {

    @IBOutlet weak var calendarView: FSCalendar!
    override func viewDidLoad() {
        super.viewDidLoad()

        calendarView.delegate = self
        calendarView.dataSource = self
    }

}

extension CalendarBasicViewController: FSCalendarDelegate, FSCalendarDataSource{
    
}
