//
//  PopupFilterVC.swift
//  BookingVP
//
//  Created by HoangVanDuc on 11/22/19.
//  Copyright © 2019 HoangVanDuc. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class PopupFilterVC: BaseViewController {
    
    var tableView: UITableView!
    var viewInput: UIView!
    var datas: [EntityPopup] = []
    var tagItemSelected: Int = 0
    var viewContentPopup: UIView!
    var isRoomType: Bool = false
    
    @IBOutlet weak var viewControl: UIControl!
    var onSelectItemFilter: ((EntityPopup) -> (Void))?
    
    init(viewInput: UIView, datas: [EntityPopup], tagItemSelected: Int) {
        super.init(nibName: "PopupFilterVC", bundle: nil)
        self.viewInput = viewInput
        self.datas = datas
        self.tagItemSelected = tagItemSelected
    }
    
    init(viewInput: UIView, datas: [EntityPopup], tagItemSelected: Int, isRoomType: Bool) {
        super.init(nibName: "PopupFilterVC", bundle: nil)
        self.viewInput = viewInput
        self.datas = datas
        self.tagItemSelected = tagItemSelected
        self.isRoomType = isRoomType
    }

    required init?(coder: NSCoder) {
         super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isShowNavigationBar = false
        self.view.backgroundColor = UIColor.clear
        createTableView()
//        let tap = UITapGestureRecognizer.init(target: self, action: #selector(actionBackground))
//        viewControl.isUserInteractionEnabled = true
//        viewControl.addGestureRecognizer(tap)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    @objc func actionBackground() {
        self.closePopup()
    }
    
    @IBAction func actionClickBG(_ sender: Any) {
        self.closePopup()
    }
    
    func createTableView() {
        var xTD = self.viewInput.frame.origin.x
        var yTD = self.viewInput.frame.origin.y - 8
        var width = self.viewInput.frame.size.width

        var height = 37
        var isScroll = false
        if datas.count >= 1 && datas.count < 5 {
            height = 37 * datas.count
            isScroll = false
        } else {
            height = 37 * 5
            isScroll = true
        }
        
        if isRoomType {
            xTD += 16
            width -= 32
            yTD += CGFloat(height) + 8
        }
        
        viewContentPopup = UIView.init(frame: CGRect.init(x: xTD, y: yTD, width: width, height: CGFloat(height)))
        
        tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: width, height: CGFloat(height)))
        tableView.isScrollEnabled = isScroll
        tableView.backgroundColor = UIColor.clear
        tableView.alpha = 1
        tableView.separatorColor = UIColor.clear
        viewContentPopup.addSubview(tableView)
        self.viewControl.addSubview(viewContentPopup)
        viewContentPopup.backgroundColor = UIColor.white
        viewContentPopup.layer.cornerRadius = 5
        viewContentPopup.clipsToBounds = true
        tableView.layer.cornerRadius = 5
        tableView.register(UINib.init(nibName: "PopupFilterCell", bundle: nil), forCellReuseIdentifier: "PopupFilterCell")
        initData()
        addShadow(view: viewContentPopup)
    }
    
    func addShadow(view: UIView) {
        view.layer.shadowPath =
            UIBezierPath(roundedRect: view.bounds,
              cornerRadius: view.layer.cornerRadius).cgPath
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 1, height: 1)
        view.layer.shadowRadius = 6
        view.layer.masksToBounds = false
    }
    
    func closePopup() {
        UIView.animate(withDuration: 0.2, animations: {
            self.viewContentPopup.alpha = 0
        }) { (isCompleted) in
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    func initData() {
        let dataTable = Observable.just(datas)
        
        dataTable.bind(to: tableView.rx.items(cellIdentifier: "PopupFilterCell", cellType: PopupFilterCell.self)) {
            (row, item, cell) in
            cell.lbName.text = item.name
            cell.ivSelected.isHidden = !(item.tag == self.tagItemSelected)
        }.disposed(by: disponseBag)
        
        tableView.rx
        .modelSelected(EntityPopup.self)
        .subscribe(onNext:  { value in
            if let selectedRowIndexPath = self.tableView.indexPathForSelectedRow {
                self.tableView.deselectRow(at: selectedRowIndexPath, animated: true)
            }
            self.onSelectItemFilter?(value)
            self.closePopup()
        })
        .disposed(by: disponseBag)
    }
}

class EntityPopup: NSObject {
    var tag: Int = 0
    var name: String = ""
    
    init(tag: Int, name: String) {
        self.tag = tag
        self.name = name
    }
}
