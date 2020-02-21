//
//  RoomTypeCell.swift
//  BookingVP
//
//  Created by HoangVanDuc on 11/28/19.
//  Copyright © 2019 HoangVanDuc. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class RoomTypeCell: UITableViewCell {
    @IBOutlet weak var viewNormal: UIView!
    @IBOutlet weak var lbNormal: UILabel!
    @IBOutlet weak var viewVip: UIView!
    @IBOutlet weak var lbVip: UILabel!
    @IBOutlet weak var viewVVip: UIView!
    @IBOutlet weak var lbVVip: UILabel!
    @IBOutlet weak var btnVVip: UIButton!
    @IBOutlet weak var btnVip: UIButton!
    @IBOutlet weak var btnNormal: UIButton!
    @IBOutlet weak var tfRoomType: UITextField!
    @IBOutlet weak var btnSelectType: UIButton!
    var entitySelected: EntityPopup?
    var onSelect: ((EntityPopup) -> Void)?
    let rxBag = DisposeBag()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.viewVip.layer.cornerRadius = 5
        self.viewVip.clipsToBounds = true
        self.viewVVip.layer.cornerRadius = 5
        self.viewVVip.clipsToBounds = true
        self.viewNormal.layer.cornerRadius = 5
        self.viewNormal.clipsToBounds = true
        
        self.tfRoomType.setIcon(UIImage.init(named: "ic_drop_down") ?? UIImage(), padding: 10)
        
        btnSelectType.rx.tap.subscribe(onNext: { (_) in
            if let entitySelected = self.entitySelected {
                self.onSelect?(entitySelected)
            }
        }).disposed(by: rxBag)
    }
    
    func setDataType(entitySelected: EntityPopup) {
        self.entitySelected = entitySelected
        self.tfRoomType.text = entitySelected.name
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
