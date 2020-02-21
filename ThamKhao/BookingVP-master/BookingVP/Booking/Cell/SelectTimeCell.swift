//
//  SelectTimeCell.swift
//  BookingVP
//
//  Created by HoangVanDuc on 11/29/19.
//  Copyright © 2019 HoangVanDuc. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class SelectTimeCell: UITableViewCell {

    @IBOutlet weak var tfStartTime: UITextField!
    @IBOutlet weak var tfEndTime: UITextField!
    @IBOutlet weak var btnStartTime: UIButton!
    @IBOutlet weak var btnEndTime: UIButton!
    
    let dis = DisposeBag()
    var onSelectTime: ((Bool) -> Void)?
    let formatter = DateFormatter()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.formatter.dateFormat = "dd/MM/yyyy"
        self.initUI()
    }
    
    func initUI() {
        self.tfStartTime.setIcon(UIImage.init(named: "ic_drop_down") ?? UIImage(), padding: 25)
        self.tfEndTime.setIcon(UIImage.init(named: "ic_drop_down") ?? UIImage(), padding: 25)
        
        self.btnEndTime.rx.tap.subscribe(onNext: { (_) in
            self.onSelectTime?(false)
        }).disposed(by: dis)
        
        self.btnStartTime.rx.tap.subscribe(onNext: { (_) in
            self.onSelectTime?(true)
        }).disposed(by: dis)
    }
    
    func binData(startTime: Date, endTime: Date) {
        self.tfStartTime.text = formatter.string(from: startTime)
        self.tfEndTime.text = formatter.string(from: endTime)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
