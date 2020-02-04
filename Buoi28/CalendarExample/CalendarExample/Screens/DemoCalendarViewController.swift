//
//  DemoCalendarViewController.swift
//  CalendarExample
//
//  Created by Taof on 6/12/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit
import FSCalendar

class DemoCalendarViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var calendar: FSCalendar!
    
    fileprivate let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
//        calendar.formatter.accessibilityViewIsModal = true
    }

    func setupView(){
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
//        containerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
//        containerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 8/10).isActive = true
        containerView.heightAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 1).isActive = true
        
        containerView.backgroundColor = .clear
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor.lightGray.cgColor
        
        calendar.translatesAutoresizingMaskIntoConstraints = false
        calendar.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8).isActive = true
        calendar.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 8).isActive = true
        calendar.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -8).isActive = true
        calendar.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8).isActive = true
    }
}
