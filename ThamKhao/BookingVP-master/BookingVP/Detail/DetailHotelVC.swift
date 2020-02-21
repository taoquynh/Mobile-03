//
//  DetailHotelVC.swift
//  BookingVP
//
//  Created by HoangVanDuc on 11/22/19.
//  Copyright © 2019 HoangVanDuc. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import RxDataSources

class DetailHotelVC: BaseViewController, UITableViewDelegate {
    var hotel: Hotel2!
    
    @IBOutlet weak var btnBooking: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var ivBackNav: UIImageView!
    let imageCollectionCell = "ImageCollectionCell"
    
    let headerDetailView = "HeaderDetailView"
    let emptyTableViewCell = "EmptyTableViewCell"
    let descriptionHotelCell = "DescriptionHotelCell"
    let nameCell = "NameCell"
    var isResumeTimer: Bool = false
    
    var timer: Timer!
    
    var dataSource = RxTableViewSectionedReloadDataSource<SectionTableViewCell>(
        configureCell: { (_,_,_,_) in
            fatalError()
    })
    
    
    let sections = [
        SectionTableViewCell(header: EntityHeaderTableView.init(headerName: "", isCollapse: false), items: [EntityTableViewCell.init(name: "", description: ""), EntityTableViewCell.init(name: "", description: "Tọa lạc tại vị trí đắc địa ngay trong khuôn viên Vinhomes Imperia, Vinpearl Hotel Rivera Hải Phòng là tòa khách sạn 5 sao mang dáng vẻ thanh lịch và sang trọng. Hơi thở trữ tình và cổ điển của những công trình phong cách Pháp trên đất Cảng giao hòa với vẻ đẹp thời đại năng động và ấn tượng, được cảm nhận rõ nét qua lối kiến trúc tân cổ điển tinh mỹ.")]),
    SectionTableViewCell(header: EntityHeaderTableView.init(headerName: "Nhà hàng & Bar", isCollapse: true), items: [EntityTableViewCell.init(name: "", description: "Với bàn tay chế biến của những đầu bếp tài hoa và sự phục vụ chuyên nghiệp của đội ngũ nhân viên, du khách không chỉ được thưởng thức tinh hoa ẩm thực Việt Nam và quốc tế được bài trí đặc sắc mà còn được dịp ấn tượng bởi dịch vụ tận tâm và không gian sang trọng.")]),
    SectionTableViewCell(header: EntityHeaderTableView.init(headerName: "Hội họp & Sự kiện", isCollapse: true), items: [EntityTableViewCell.init(name: "", description: "Với hệ thống phòng họp tối tân và đội ngũ chuyên gia đầy nhiệt huyết, Vinpearl Hotel Rivera Hải Phòng là lựa chọn hoàn hảo cho các chương trình hội nghị lớn nhỏ, các sự kiện đón tiếp, chiêu đãi khách VIP, gặp gỡ đối tác quan trọng.")]),
    SectionTableViewCell(header: EntityHeaderTableView.init(headerName: "Giải trí", isCollapse: true), items: [EntityTableViewCell.init(name: "", description: "Các dịch vụ khách sạn đẳng cấp như Vincharm Spa, trung tâm thể hình, bể bơi ngoài trời... cộng hưởng với các tiện ích nội khu hiện đại của Vinhomes Imperia Hải Phòng đem đến những trải nghiệm lưu trú trọn vẹn nhất cho khách hàng.")]),
    SectionTableViewCell(header: EntityHeaderTableView.init(headerName: "Liên hệ", isCollapse: true), items: [EntityTableViewCell.init(name: "", description: "- Địa chỉ: Tòa nhà A - Văn phòng Vingroup Số 7, đường Bằng Lăng, Vinhomes Riverside Long Biên, Hà Nội, Việt Nam \n- Email: callcenter@vinpearl.com \n- Số điện thoại: (+84) 1900 636 699 - (+84) 243 974 9999")])]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.isShowNavigationBar = false
        configUI()
        loadImageCover()
        configTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if isResumeTimer {

        }
    }
    
    func configUI() {
        btnBooking.layer.cornerRadius = 8
        
        let tapImg = UITapGestureRecognizer.init(target: self, action: #selector(onBackNav))
        ivBackNav.isUserInteractionEnabled = true
        ivBackNav.addGestureRecognizer(tapImg)
        ivBackNav.dropShadow()
        
        collectionView.register(UINib.init(nibName: imageCollectionCell, bundle: nil), forCellWithReuseIdentifier: imageCollectionCell)
        collectionView.rx.setDelegate(self).disposed(by: disponseBag)
        collectionView.isScrollEnabled = false
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerDetailView) as? HeaderDetailView, section > 0 {
            view.lbTitleHeader.text = dataSource[section].header.headerName
            view.onCollapse = { [unowned self] value in
                self.dataSource[section].header.isCollapse = !self.dataSource[section].header.isCollapse
                view.expandOrCollapse(self.dataSource[section].header.isCollapse)
                let indexPath = IndexPath.init(row: 0, section: section)
                self.tableView.beginUpdates()
                self.tableView.reloadItemsAtIndexPaths([indexPath], animationStyle: .none)
                self.tableView.endUpdates()
            }
            view.ivExpand.isHidden = section == 4
//            view.onUpdateTableView = {
//                self.tableView.reloadData()
//            }
            return view
        }
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNonzeroMagnitude
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section > 0 ? 40 : CGFloat.leastNonzeroMagnitude
    }
    
    func configTableView() {
        tableView.separatorColor = UIColor.clear
        let list: [String] = [nameCell, descriptionHotelCell, emptyTableViewCell]
        for item in list {
            tableView.register(UINib.init(nibName: item, bundle: nil), forCellReuseIdentifier: item)
        }
        
        tableView.register(UINib.init(nibName: headerDetailView, bundle: nil), forHeaderFooterViewReuseIdentifier: headerDetailView)
        tableView.rx
        .setDelegate(self)
        .disposed(by: disponseBag)
        
        dataSource = RxTableViewSectionedReloadDataSource<SectionTableViewCell>(configureCell: { (dataSource, tableView, indexPath, item) -> UITableViewCell in
            if indexPath.section == 0 {
                if indexPath.row == 0 {
                    return self.getNameCell(indexPath: indexPath, item: item, tableView: tableView)
                } else {
                    return self.getDescriptionHotelCell(indexPath: indexPath, item: item, tableView: tableView)
                }
            } else if indexPath.section == 1 {
                let sectionE = dataSource[indexPath.section].header
                if sectionE.isCollapse {
                    return self.getEmptyCell(tableView: tableView)
                } else {
                    return self.getDescriptionHotelCell(indexPath: indexPath, item: item, tableView: tableView)
                }
            }
            else if indexPath.section == 2 {
                let sectionE = dataSource[indexPath.section].header
                if sectionE.isCollapse {
                    return self.getEmptyCell(tableView: tableView)
                } else {
                    return self.getDescriptionHotelCell(indexPath: indexPath, item: item, tableView: tableView)
                }
            }
            else if indexPath.section == 3 {
                let sectionE = dataSource[indexPath.section].header
                if sectionE.isCollapse {
                    return self.getEmptyCell(tableView: tableView)
                } else {
                    return self.getDescriptionHotelCell(indexPath: indexPath, item: item, tableView: tableView)
                }
            } else {
                return self.getDescriptionHotelCell(indexPath: indexPath, item: item, tableView: tableView)
            }
//             return UITableViewCell()
        })
        
        Observable.just(sections)
        .bind(to: tableView.rx.items(dataSource: dataSource))
        .disposed(by: disponseBag)
    }
    
    func getEmptyCell(tableView: UITableView) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: emptyTableViewCell) as? EmptyTableViewCell {
            return cell
        }
        return UITableViewCell()
    }
    
    func getNameCell(indexPath: IndexPath, item: EntityTableViewCell, tableView: UITableView) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: self.nameCell) as? NameCell {
            return cell
        }
        return UITableViewCell()
    }
    
    func getDescriptionHotelCell(indexPath: IndexPath, item: EntityTableViewCell, tableView: UITableView) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: self.descriptionHotelCell) as? DescriptionHotelCell {
            cell.lbDescription.text = item.description
            return cell
        }
        return UITableViewCell()
    }
    
    @objc func onBackNav() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionBooking(_ sender: Any) {
        let vc = BookingVC()
        self.isResumeTimer = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func loadImageCover() {
        var listImage: [UIImage] = []
        let Urls = ["https://www.gstatic.com/webp/gallery/3.jpg","https://www.gstatic.com/webp/gallery/5.jpg","https://www.gstatic.com/webp/gallery/4.jpg"]
        for (index,url) in Urls.enumerated() {
            let isLast = (index == (Urls.count - 1))
            guard let url = URL.init(string: url) else {continue}
            let urlRequest = URLRequest.init(url: url)
            var image: UIImage?
            
            URLSession.shared.rx
                .response(request: urlRequest)
                .subscribeOn(MainScheduler.instance)
                .subscribe(onNext: { (data) in
                    image = UIImage.init(data: data.data)
                }, onError: { (error) in
                    print(error)
                }, onCompleted: {
                    if let image = image {
                        listImage.append(image)
                    }
                    if isLast {
                        DispatchQueue.main.async {
                            self.updateCollectionView(listImage: listImage)
                        }
                    }
                }, onDisposed: nil).disposed(by: disponseBag)
            
        }
    }
    
    func updateCollectionView(listImage: [UIImage]) {
        //cách 1
        //        Observable
        //        .just(listImage)
        //            .bind(to: collectionView.rx.items(cellIdentifier: "ImageCollectionCell")) { row, item, cell in
        //                let indexPath = IndexPath(item: row, section: 0)
        //                if let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: self.imageCollectionCell, for: indexPath) as? ImageCollectionCell {
        //                     cell.binUIImage(image: item)
        //                }
        //
        //        }.disposed(by: disponseBag)
        //cách 2
        let dataSource : PublishSubject<[UIImage]> = PublishSubject.init()
        dataSource.asObservable().bind(to: self.collectionView.rx.items) { (collectionView, row, element ) in
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.imageCollectionCell, for: IndexPath(row : row, section : 0)) as? ImageCollectionCell {
                cell.binUIImage(image: element)
                if row == 0 { self.perform(#selector(self.startTimer), with: nil, afterDelay: 0.2)
                }
                return cell
            } else {
                print("Not find ImageCollectionCell")
                return UICollectionViewCell()
            }
        }.disposed(by: disponseBag)
        dataSource.onNext(listImage)
    }
}

extension DetailHotelVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (self.getHeightSafeAreaTop() > 0) ? (self.collectionView.frame.size.width + 10) : 0
        let height = (self.getHeightSafeAreaTop() > 0) ? self.collectionView.frame.size.height + 44 : 0
        return CGSize.init(width: width, height: height)
    }
    
    @objc func scrollToNextCell(){
       
        let indexPaths = self.collectionView.indexPathsForVisibleItems
        if indexPaths.count == 1 {
            if indexPaths[0].row == 0 {
                let indexPath = IndexPath.init(row: 1, section: 0)
                collectionView.scrollToItem(at: indexPath, at: .right, animated: true)
                pageControl.currentPage = indexPath.row
            } else if indexPaths[0].row == 1 {
                
                let indexPath = IndexPath.init(row: 2, section: 0)
                pageControl.currentPage = indexPath.row
                collectionView.scrollToItem(at: indexPath, at: .right, animated: true)
            } else if indexPaths[0].row == 2 {
                let indexPath = IndexPath.init(row: 0, section: 0)
                pageControl.currentPage = indexPath.row
                collectionView.scrollToItem(at: indexPath, at: .right, animated: false)
            } else {
                return
            }
        } else {
            if indexPaths[0].row == 0 {
                let indexPath = IndexPath.init(row: 0, section: 0)
                collectionView.scrollToItem(at: indexPath, at: .right, animated: true)
                pageControl.currentPage = indexPath.row
            } else if indexPaths[0].row == 1 {
                
                let indexPath = IndexPath.init(row: 1, section: 0)
                pageControl.currentPage = indexPath.row
                collectionView.scrollToItem(at: indexPath, at: .right, animated: true)
            } else if indexPaths[0].row == 2 {
                let indexPath = IndexPath.init(row: 2, section: 0)
                pageControl.currentPage = indexPath.row
                collectionView.scrollToItem(at: indexPath, at: .right, animated: false)
            } else {
                return
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.perform(#selector(self.scrollToNextCell), with: nil, afterDelay: 3)
    }
    
    @objc func startTimer() {
        
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(scrollToNextCell), userInfo: nil, repeats: false)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        timer.invalidate()
    }
}

class EntityTableViewCell {
  var name: String = ""
  var description: String = ""
    
    init(name: String, description: String) {
        self.name = name
        self.description = description
    }
}

class EntityHeaderTableView {
    var headerName: String = ""
    var isCollapse: Bool = true
    
    init(headerName: String, isCollapse: Bool) {
        self.headerName = headerName
        self.isCollapse = isCollapse
    }
}

struct SectionTableViewCell {
    var header: EntityHeaderTableView
    var items: [Item]
}

extension SectionTableViewCell: SectionModelType {
    typealias Item = EntityTableViewCell
    
    init(original: SectionTableViewCell, items: [Item]) {
       self = original
       self.items = items
     }
}
