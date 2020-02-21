//
//  BookingVC.swift
//  BookingVP
//
//  Created by HoangVanDuc on 11/26/19.
//  Copyright © 2019 HoangVanDuc. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import RxDataSources

class BookingVC: BaseViewController {
    
    @IBOutlet weak var btnSendRequire: UIButton!
    @IBOutlet weak var tableView: UITableView!
    let disposeBag = DisposeBag()
    
    let enterInfoCell: String = "EnterInfoCell"
    let selectTimeCell: String = "SelectTimeCell"
    let roomTypeCell: String = "RoomTypeCell"
    let countRoomCell: String = "CountRoomCell"
    let totalPriceCell: String = "TotalPriceCell"
    let listCell: [String] = ["EnterInfoCell","CountRoomCell","SelectTimeCell","RoomTypeCell","TotalPriceCell"]
    var itemSelectRoomType: EntityPopup!
    
    var listIndexCell: [TypeCell] = [.enterInfoCell,.countRoomCell,.dateCell,.roomTypeCell,.totalPriceCell]
    var dataSource = RxTableViewSectionedReloadDataSource<EntitySectionBooking>(
        configureCell: { (_,_,_,_) in
            fatalError()
    })
    let itemsPopup = [
        EntityPopup.init(tag: 0, name: "Thường"),
        EntityPopup.init(tag: 1, name: "VIP"),
        EntityPopup.init(tag: 2, name: "VVIP")
    ]
    
    //
    var startTime: Date = Date()
    var endTime: Date = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isShowNavigationBar = true
        self.navigationItem.title = "Đặt phòng"
        self.btnSendRequire.layer.cornerRadius = 8
        self.itemSelectRoomType = itemsPopup[0]
        self.endTime = Calendar.current.date(byAdding: .day, value: 1, to: Date()) ?? Date()
        self.startTime = self.endTime
        self.initUI()
    }
    
    func initUI() {
        self.btnSendRequire.rx.tap.subscribe(onNext: { (_) in
            
        }).disposed(by: disposeBag)
        
        self.initTableView()
    }
    
    func initTableView() {
        self.tableView.separatorColor = UIColor.clear
        for item in listCell {
            self.tableView.register(UINib.init(nibName: item, bundle: nil), forCellReuseIdentifier: item)
        }
        
        self.dataSource = RxTableViewSectionedReloadDataSource<EntitySectionBooking>(configureCell: { (dataSource, tableView, indexPath, item) -> UITableViewCell in
            
            if indexPath.row == 0 {
                if let cell = tableView.dequeueReusableCell(withIdentifier: self.listCell[indexPath.row]) as? EnterInfoCell {
                    return cell
                }
            } else if indexPath.row == 1 {
                if let cell = tableView.dequeueReusableCell(withIdentifier: self.listCell[indexPath.row]) as? CountRoomCell {
                    return cell
                }
            } else if indexPath.row == 3 {
                if let cell = tableView.dequeueReusableCell(withIdentifier: self.listCell[indexPath.row]) as? RoomTypeCell {
                    cell.setDataType(entitySelected: self.itemSelectRoomType)
                    cell.onSelect = { [unowned self] value in
                        self.onSelectPopup(value: value)
                    }
                    return cell
                }
            } else if indexPath.row == 2 {
                if let cell = tableView.dequeueReusableCell(withIdentifier: self.listCell[indexPath.row]) as? SelectTimeCell {
                    cell.binData(startTime: self.startTime, endTime: self.endTime)
                    cell.onSelectTime = { [unowned self] value in
                        self.onSelectTime(value)
                    }
                    return cell
                }
            } else if indexPath.row == 4 {
                if let cell = tableView.dequeueReusableCell(withIdentifier: self.listCell[indexPath.row]) as? TotalPriceCell {
                    return cell
                }
            }
            return UITableViewCell()
        })
        
        let sections = [EntitySectionBooking.init(items: [EntityItemSectionBooking.init(typeCell: .enterInfoCell),EntityItemSectionBooking.init(typeCell: .dateCell), EntityItemSectionBooking.init(typeCell: .roomTypeCell), EntityItemSectionBooking.init(typeCell: .countRoomCell), EntityItemSectionBooking.init(typeCell: .totalPriceCell)])]
        
        Observable.just(sections)
        .bind(to: tableView.rx.items(dataSource: dataSource))
        .disposed(by: disponseBag)
    }
    
    func onSelectPopup(value: EntityPopup) {
        let indexPath = IndexPath.init(row: 3, section: 0)
        guard let cell = tableView.cellForRow(at: indexPath), let cell2 = cell as? RoomTypeCell else { return }
        let vc = PopupFilterVC.init(viewInput: cell2, datas: itemsPopup, tagItemSelected: self.itemSelectRoomType.tag, isRoomType: true)
        vc.modalPresentationStyle = .overCurrentContext
        vc.onSelectItemFilter = { [unowned self] (value) in
            self.itemSelectRoomType = value
            self.tableView.reloadData()
        }
        self.present(vc, animated: false)
    }
    
    func onSelectTime(_ isStart: Bool) {
        let dateInput: Date = isStart ? self.startTime : self.endTime
        let vc = PopupSelectTimeVC.init(dateSelect: dateInput)
        vc.modalPresentationStyle = .overCurrentContext
        vc.onSelectDate = { [unowned self] date in
            if isStart {
                self.startTime = date
            } else {
                self.endTime = date
            }
            self.tableView.reloadData()
        }
        self.present(vc, animated: false, completion: nil)
    }
}

enum TypeCell: Int {
    case none = -1
    case enterInfoCell = 0
    case countRoomCell = 1
    case roomTypeCell = 3
    case dateCell = 2
    case totalPriceCell = 4
}

class EntityItemSectionBooking {
    var typeCell: TypeCell = .none
    
    init(typeCell: TypeCell) {
        self.typeCell = typeCell
    }
}

struct EntitySectionBooking {
    var items: [Item]
}

extension EntitySectionBooking: SectionModelType {
    init(original: EntitySectionBooking, items: [EntityItemSectionBooking]) {
        self = original
        self.items = items
    }
    
    typealias Item = EntityItemSectionBooking
}
