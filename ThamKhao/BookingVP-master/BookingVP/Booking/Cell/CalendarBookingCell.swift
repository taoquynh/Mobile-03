//
//  CalendarBookingCell.swift
//  BookingVP
//
//  Created by HoangVanDuc on 11/26/19.
//  Copyright © 2019 HoangVanDuc. All rights reserved.
//

import UIKit
import JTAppleCalendar

class CalendarBookingCell: UITableViewCell {
    
    @IBOutlet weak var tfFrom: UITextField!
    @IBOutlet weak var lbFrom: UILabel!
    @IBOutlet weak var calandarView: JTAppleCalendarView!
    @IBOutlet weak var lbTo: UILabel!
    @IBOutlet weak var tfTo: UITextField!
    @IBOutlet weak var lbMonth: UILabel!
    
    var startDate: Date = Date()
    let numberOfRows: Int = 6
    let calendarCell: String = "CalendarCell"
    let formatter: DateFormatter = DateFormatter()
    var currentMonthPage: Date = Date()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        startDate = Calendar.current.date(byAdding: .day, value: 1, to: Date()) ?? Date()
        calandarView.minimumLineSpacing = 0
        calandarView.minimumInteritemSpacing = 0
        calandarView.calendarDelegate = self
        calandarView.calendarDataSource = self
        
        calandarView.register(UINib(nibName: "CalendarSectionHeaderView", bundle: nil),
                              forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                              withReuseIdentifier: "CalendarSectionHeaderView")
        calandarView.register(UINib.init(nibName: calendarCell, bundle: nil), forCellWithReuseIdentifier: calendarCell)
        
        self.calandarView.scrollToDate(Date(),animateScroll: false)
        self.calandarView.selectDates([ Date() ])
        
        formatter.dateFormat = "MMMM YYYY"
        self.lbMonth.text = formatter.string(from: Date())
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    
    // Configure the cell
    func configureCell(cell: JTAppleCell?, cellState: CellState) {
        guard let currentCell = cell as? CalendarCell else {
            return
        }
        
        currentCell.lbDay.text = cellState.text
        configureSelectedStateFor(cell: currentCell, cellState: cellState)
        configureTextColorFor(cell: currentCell, cellState: cellState)
        let cellHidden = cellState.dateBelongsTo != .thisMonth
        currentCell.isHidden = cellHidden
        
    }
    
    // Configure text colors
    func configureTextColorFor(cell: JTAppleCell?, cellState: CellState){
        
        guard let currentCell = cell as? CalendarCell else {
            return
        }
        if cellState.isSelected{
            currentCell.lbDay.textColor = UIColor.black
        }else{
            if cellState.dateBelongsTo == .thisMonth && cellState.date > Date()  {
                currentCell.lbDay.textColor = UIColor.white
            }else{
                currentCell.lbDay.textColor = UIColor.gray
            }
        }
    }
    
    
    func configureSelectedStateFor(cell: JTAppleCell?, cellState: CellState){
        
        guard let currentCell = cell as? CalendarCell else {
            return
        }
        if cellState.isSelected{
            currentCell.viewSelect.isHidden = false
            currentCell.background.isHidden = true
        }else{
            currentCell.viewSelect.isHidden = true
            currentCell.background.isHidden = true
        }
    }
}

extension CalendarBookingCell: JTAppleCalendarViewDelegate, JTAppleCalendarViewDataSource{
    
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCell
        configureCell(cell: cell, cellState: cellState)
        self.currentMonthPage = date
        self.updateMonth()
        return cell
        
    }
    
    func updateMonth() {
        UIView.animate(withDuration: 1) {
            self.lbMonth.text = self.formatter.string(from: self.currentMonthPage)
        }
        
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        configureCell(cell: cell, cellState: cellState)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        configureCell(cell: cell, cellState: cellState)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, headerViewForDateRange range: (start: Date, end: Date), at indexPath: IndexPath) -> JTAppleCollectionReusableView {
        let header = calendar.dequeueReusableJTAppleSupplementaryView(withReuseIdentifier: "CalendarSectionHeaderView", for: indexPath)
        let date = range.start
        (header as! CalendarSectionHeaderView).title.text = formatter.string(from: date)
        
        return header
    }
    
    func calendarSizeForMonths(_ calendar: JTAppleCalendarView?) -> MonthSize? {
        return MonthSize(defaultSize: 0)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCell
        configureCell(cell: cell, cellState: cellState)
        
    }
    
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        formatter.dateFormat = "dd MM yy"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        calendar.scrollingMode = .stopAtEachSection
        
        let startDate = formatter.date(from: "01 01 18")!
        let endDate = formatter.date(from: "31 12 20")!
        
        let parameters = ConfigurationParameters(startDate: startDate,
                                                 endDate: endDate,
                                                 numberOfRows: numberOfRows,
                                                 calendar: Calendar.current,
                                                 generateInDates: .forAllMonths,
                                                 generateOutDates: .tillEndOfRow,
                                                 firstDayOfWeek: .sunday,
                                                 hasStrictBoundaries: true)
        return parameters
    }
}
