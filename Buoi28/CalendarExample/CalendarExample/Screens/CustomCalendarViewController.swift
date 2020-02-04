//
//  CustomCalendarViewController.swift
//  CalendarExample
//
//  Created by Taof on 6/12/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit
import FSCalendar

class CustomCalendarViewController: UIViewController {
    
    deinit {
        print("deinit")
    }
    // định danh cho lịch dương - lịch phương Tây
    fileprivate let gregorian = Calendar(identifier: .gregorian)
    
    // định nghĩa format date định dạng năm-tháng-ngày
    fileprivate let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    fileprivate weak var calendar: FSCalendar!
    fileprivate weak var eventLabel: UILabel!
    
    override func loadView() {
        super.loadView()
        
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = UIColor.groupTableViewBackground
        self.view = view
        
        let height: CGFloat = UIDevice.current.model.hasPrefix("iPad") ? 400 : 300
        let calendar = FSCalendar(frame: CGRect(x: 0, y: self.navigationController!.navigationBar.frame.maxY, width: view.frame.size.width, height: height))
        
        // tuần bắt đầu từ thứ 2
        calendar.firstWeekday = 2
        // thay đổi hiện thị header (phần tháng năm)
        calendar.appearance.headerDateFormat = "MMMM yyyy"
        // chỉnh alpha của headerMinimum về 0 để ẩn đi tháng trước đó và tiếp theo
        calendar.appearance.headerMinimumDissolvedAlpha = 0.1
        calendar.calendarHeaderView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.1)
        calendar.calendarWeekdayView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.1)
//        calendar.appearance.eventOffset = CGPoint(x: 0, y: -7)
        
        let scopeGesture = UIPanGestureRecognizer(target: calendar, action: #selector(calendar.handleScopeGesture(_:)));
        calendar.addGestureRecognizer(scopeGesture)
        
        calendar.delegate = self
        calendar.dataSource = self
        calendar.register(CalendarCollectionViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(calendar)
        self.calendar = calendar
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension CustomCalendarViewController: FSCalendarDataSource{
    func calendar(_ calendar: FSCalendar, imageFor date: Date) -> UIImage? {
        if date == calendar.today {
            return UIImage(named: "sun-yellow")
        } else {
            let day: Int! = self.gregorian.component(.day, from: date)
            return [13, 24].contains(day) ? UIImage(named: "sun-blue") : nil
        }
    }
    
    func calendar(_ calendar: FSCalendar, cellFor date: Date, at position: FSCalendarMonthPosition) -> FSCalendarCell {
        let cell = calendar.dequeueReusableCell(withIdentifier: "cell", for: date, at: position)
        return cell
    }
}

extension CustomCalendarViewController: FSCalendarDelegate{
    // Thay đổi tháng
    func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
        print("Change page to \(self.formatter.string(from: calendar.currentPage))")
    }
    
    // Chọn ngày
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print("Calendar did select date \(self.formatter.string(from: date))")
        // Nếu ngày được chọn là của tháng trước hoặc tháng sau thì tự động chuyển tháng
        if monthPosition == .previous || monthPosition == .next {
            calendar.setCurrentPage(date, animated: true)
        }
    }
}
