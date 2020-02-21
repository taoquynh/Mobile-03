//
//  HomeVC.swift
//  BookingVP
//
//  Created by HoangVanDuc on 11/21/19.
//  Copyright © 2019 HoangVanDuc. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class HomeVC: BaseViewController {

    //
    @IBOutlet weak var vAddress: UIView!
    @IBOutlet weak var lbAddress: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var ivNoti: UIImageView!
    
    //
    @IBOutlet weak var cstHeightViewSafeArea: NSLayoutConstraint!
    
    let hotelCell = "HotelCell"
    var hotels = Observable.just([])
    var itemFilterSelected: EntityPopup?

    let items = [
        Hotel2(hotelId: "abc123", name: "Hotel Hạ Long", image: "123"),
        Hotel2(hotelId: "abc1234", name: "Hotel Hạ Long 2", image: "1234"),
        Hotel2(hotelId: "abc1235", name: "Hotel Hạ Long 3", image: "1235"),
        Hotel2(hotelId: "abc1235", name: "Hotel Hạ Long 3", image: "1235"),
        Hotel2(hotelId: "abc1235", name: "Hotel Hạ Long 3", image: "1235"),
        Hotel2(hotelId: "abc1235", name: "Hotel Hạ Long 3", image: "1235"),
        Hotel2(hotelId: "abc1235", name: "Hotel Hạ Long 3", image: "1235")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.isShowNavigationBar = false
        initUI()
        initData()
    }
    
    func initUI() {
        tableView.register(UINib.init(nibName: hotelCell, bundle: nil), forCellReuseIdentifier: hotelCell)
        tableView.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 16, right: 0)
        tableView.separatorColor = UIColor.clear
        tableView.backgroundColor = UIColor.clear
        vAddress.layer.cornerRadius = 5
        vAddress.layer.borderColor = UIColor.lightGray.cgColor
        vAddress.layer.borderWidth = 0.5
        lbAddress.textColor = UIColor.textMain
        
        let tapNoti = UITapGestureRecognizer.init(target: self, action: #selector(gotoNotificationVC))
        ivNoti.isUserInteractionEnabled = true
        ivNoti.addGestureRecognizer(tapNoti)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.cstHeightViewSafeArea.constant = self.getHeightSafeAreaTop()
    }
    
    func initData() {
        hotels = Observable.just(items)
        hotels.bind(to: tableView.rx.items(cellIdentifier: hotelCell, cellType: HotelCell.self)) {
            (row, item, cell) in
            
        }.disposed(by: disponseBag)
        
        tableView.rx
        .modelSelected(Hotel2.self)
        .subscribe(onNext:  { value in
            self.onSelectItemHotel(hotel: value)
        })
        .disposed(by: disponseBag)
    }
    
    func onSelectItemHotel(hotel: Hotel2) {
//        let vc = DetailVC()
        let vc = DetailHotelVC()
        vc.hotel = hotel
        self.navigationController?.pushViewController(vc, animated: true)
        if let selectedRowIndexPath = self.tableView.indexPathForSelectedRow {
            self.tableView.deselectRow(at: selectedRowIndexPath, animated: true)
        }
    }
    
    @objc func gotoNotificationVC() {
        let vc = NotificationsVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func actionFilter(_ sender: Any) {
        let itemsPopup = [
            EntityPopup.init(tag: 0, name: "Tất cả"),
            EntityPopup.init(tag: 1, name: "Hồ Chí Minh"),
            EntityPopup.init(tag: 2, name: "Hà Nội"),
            EntityPopup.init(tag: 3, name: "Quảng Ninh"),
            EntityPopup.init(tag: 4, name: "Vũng Tàu"),
            EntityPopup.init(tag: 5, name: "Phú Quốc"),
            EntityPopup.init(tag: 6, name: "Hưng Yên")
        ]
        
        let vc = PopupFilterVC.init(viewInput: vAddress, datas: itemsPopup, tagItemSelected: itemFilterSelected?.tag ?? 0)
        vc.modalPresentationStyle = .overCurrentContext
        vc.onSelectItemFilter = { [unowned self] (value) in
            self.itemFilterSelected = value
            self.lbAddress.text = value.name
        }
        self.present(vc, animated: false)
    }
}


class Hotel2: NSObject {
    var hotelId: String = ""
    var name: String = ""
    var image: String = ""
    
    init(hotelId: String, name: String, image: String) {
        self.hotelId = hotelId
        self.name = name
        self.image = image
    }
}
