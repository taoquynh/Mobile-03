//
//  DatePickerVC.swift
//  BookingVP
//
//  Created by HoangVanDuc on 11/29/19.
//  Copyright © 2019 HoangVanDuc. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class DatePickerVC: UIViewController {
    @IBOutlet weak var cstHeightViewDate: NSLayoutConstraint!
    @IBOutlet weak var viewDate: UIView!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnDone: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var cstPaddingBottomViewDate: NSLayoutConstraint!
    @IBOutlet weak var viewControl: UIControl!
    
    let dis = DisposeBag()
    var onDidSelectDate: ((Date) -> Void)?
    var dateSelected:Date = Date()
    let formatter = DateFormatter()
    var heightViewDate: CGFloat = 290
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initUI()
    }
    
    init(dateSelect: Date) {
        super.init(nibName: "DatePickerVC", bundle: nil)
        self.dateSelected = dateSelect

    }
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker) {
        self.dateSelected = sender.date
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIView.animate(withDuration: 1) {
            self.cstPaddingBottomViewDate.constant = -10
            self.viewControl.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    func initUI() {
        self.heightViewDate = self.getHeightSafeAreaTop() + 290
        self.cstHeightViewDate.constant = self.heightViewDate
        self.cstPaddingBottomViewDate.constant = -self.heightViewDate
        self.viewControl.backgroundColor = UIColor.clear
        
        formatter.dateFormat = "dd MM yy"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        
        let dateF = DateFormatter()
        dateF.dateFormat = "yy"
        dateF.timeZone = Calendar.current.timeZone
        dateF.locale = Calendar.current.locale
        
        let dateFInt = Int(dateF.string(from: Date()))
        let endDate = formatter.date(from: "31 12 \((dateFInt ?? 30) + 1)") ?? Calendar.current.date(byAdding: .year, value: 1, to: Date())
        
        self.datePicker.minimumDate = Date()
        self.datePicker.maximumDate = endDate
        self.datePicker.setDate(self.dateSelected, animated: false)
        self.datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        
        self.viewDate.layer.cornerRadius = 5
        self.viewDate.clipsToBounds = true
        
        self.btnDone.rx.tap.subscribe(onNext: { (_) in
            self.onDidSelectDate?(self.dateSelected)
            self.closePopup()
        }).disposed(by: dis)
        
        self.btnCancel.rx.tap.subscribe(onNext: { (_) in
            self.closePopup()
        }).disposed(by: dis)
    }
    
    func closePopup() {
        UIView.animate(withDuration: 1) {
            self.cstPaddingBottomViewDate.constant = -self.heightViewDate
            self.viewControl.backgroundColor = UIColor.clear
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    @IBAction func actionBackground(_ sender: Any) {
        self.closePopup()
    }
}
