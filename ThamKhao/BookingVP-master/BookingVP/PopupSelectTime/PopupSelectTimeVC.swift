//
//  PopupSelectTimeVC.swift
//  BookingVP
//
//  Created by HoangVanDuc on 11/29/19.
//  Copyright © 2019 HoangVanDuc. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import JTAppleCalendar

class PopupSelectTimeVC: UIViewController {
    @IBOutlet weak var viewControl: UIView!
    @IBOutlet weak var viewDate: UIView!
    @IBOutlet weak var calendarView: JTAppleCalendarView!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnDone: UIButton!
    @IBOutlet weak var lbMonth: UILabel!
    
    var onSelectDate: ((Date) ->Void)?
    var dateSelect: Date = Date()
    var todayDate: Date = Date()
    
    let formatter = DateFormatter()
    let numberOfRows = 6
    var timer = Timer()
    let dis = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewDate.layer.cornerRadius = 5
        self.viewDate.clipsToBounds = true
        self.viewDate.transform = CGAffineTransform.init(scaleX: 1.2, y: 1.2)
        self.calendarView.calendarDelegate = self
        self.calendarView.calendarDataSource = self
        configureCalendarView()
        
        formatter.dateFormat = "MMMM YYYY"
        self.lbMonth.text = formatter.string(from: self.dateSelect)
        
        formatter.dateFormat = "dd/MM/yyyy"
        self.todayDate = formatter.date(from: formatter.string(from: Date())) ?? Date()
        
        self.btnCancel.rx.tap.subscribe(onNext: { (_) in
            self.closePopup()
        }).disposed(by: dis)
        
        self.btnDone.rx.tap.subscribe(onNext: { (_) in
            self.onSelectDate?(self.dateSelect)
            self.closePopup()
        }).disposed(by: dis)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    func configureCalendarView(){
        
        calendarView.minimumLineSpacing = 0
        calendarView.minimumInteritemSpacing = 0
        
        calendarView.register(UINib(nibName: "CalendarSectionHeaderView", bundle: Bundle.main),
                              forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                              withReuseIdentifier: "CalendarSectionHeaderView")
        calendarView.register(UINib.init(nibName: "CalendarCell", bundle: nil), forCellWithReuseIdentifier: "CalendarCell")
        self.calendarView.scrollToDate(self.dateSelect,animateScroll: false)
        self.calendarView.selectDates([self.dateSelect])
    }
        
    
    init(dateSelect: Date) {
        super.init(nibName: "PopupSelectTimeVC", bundle: nil)
        self.dateSelect = dateSelect
    }
    
    required init?(coder: NSCoder) {
         super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animate(withDuration: 0.2) {
            self.viewDate.transform = CGAffineTransform.identity
        }
    }
    
    @IBAction func onClosePopup(_ sender: Any) {
        self.closePopup()
    }
    
    func closePopup() {
        self.dismiss(animated: false, completion: nil)
    }
    
    // Configure the cell
    func configureCell(cell: JTAppleCell?, cellState: CellState, date: Date? = nil, isSelect: Bool = false) {
        guard let currentCell = cell as? CalendarCell else {
            return
        }
        currentCell.lbDay.backgroundColor = UIColor.clear
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
            currentCell.lbDay.textColor = UIColor.white
            
        }else{
            if cellState.dateBelongsTo == .thisMonth && cellState.date > Date()  {
                currentCell.lbDay.textColor = UIColor.black
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
            currentCell.ivSelect.isHidden = false
//            currentCell.lbDay.backgroundColor = UIColor.link
            currentCell.viewSelect.isHidden = false
        }else{
            currentCell.ivSelect.isHidden = true
//            currentCell.lbDay.backgroundColor = UIColor.clear
            currentCell.viewSelect.isHidden = true
        }
    }
}

extension PopupSelectTimeVC: JTAppleCalendarViewDataSource {
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCell
        configureCell(cell: cell, cellState: cellState)
        
    }
    
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        let dateF = DateFormatter()
        formatter.dateFormat = "dd MM yy"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        
        dateF.dateFormat = "yy"
        dateF.timeZone = Calendar.current.timeZone
        dateF.locale = Calendar.current.locale
        calendar.scrollingMode = .stopAtEachSection
        
        let startDate = Date()
        let dateFInt = Int(dateF.string(from: startDate))
        
        let endDate = formatter.date(from: "31 12 \((dateFInt ?? 30) + 1)")!
        
                let parameters = ConfigurationParameters(startDate: startDate,
                                endDate: endDate,
                                numberOfRows: numberOfRows,
                                calendar: Calendar.current,
                                generateInDates: .forAllMonths,
                                generateOutDates: .tillEndOfRow,
                                firstDayOfWeek: .monday,
                                hasStrictBoundaries: true)
        return parameters
    }
}

extension PopupSelectTimeVC:JTAppleCalendarViewDelegate{
    
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCell
        configureCell(cell: cell, cellState: cellState)
        return cell
        
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        if self.todayDate.compare(date) == .orderedDescending {
            return
        }
        self.dateSelect = date
        configureCell(cell: cell, cellState: cellState, date: date, isSelect: true)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        configureCell(cell: cell, cellState: cellState)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, headerViewForDateRange range: (start: Date, end: Date), at indexPath: IndexPath) -> JTAppleCollectionReusableView {
        let formatter = DateFormatter()
            formatter.dateFormat = "MMMM YYYY"
        let date = range.start
        timer.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            self.lbMonth.text = formatter.string(from: date)
        })
        let header = calendar.dequeueReusableJTAppleSupplementaryView(withReuseIdentifier: "CalendarSectionHeaderView", for: indexPath)
        
       
        (header as! CalendarSectionHeaderView).title.text = formatter.string(from: date)
        return header
    }
    
    func calendarSizeForMonths(_ calendar: JTAppleCalendarView?) -> MonthSize? {
        return MonthSize(defaultSize: 0.000001)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, sectionHeaderSizeFor range: (start: Date, end: Date), belongingTo month: Int) -> CGSize {
        return CGSize(width: self.viewDate.frame.size.width, height: 100)
    }

}
