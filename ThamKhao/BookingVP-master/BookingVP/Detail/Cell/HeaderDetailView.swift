//
//  HeaderDetailView.swift
//  BookingVP
//
//  Created by HoangVanDuc on 11/25/19.
//  Copyright © 2019 HoangVanDuc. All rights reserved.
//

import Foundation
import UIKit

class HeaderDetailView: UITableViewHeaderFooterView {
    
    @IBOutlet weak var separatorView: UIView!
    @IBOutlet weak var lbTitleHeader: UILabel!
    @IBOutlet weak var ivExpand: UIImageView!
    var onCollapse: ((Bool) -> Void)?
    var isCollapse: Bool = false
//    var onUpdateTableView: (() -> Void)?
    var imageX: UIImage?
    var imageY: UIImage?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundView = UIView(frame: self.bounds)
        self.backgroundView?.backgroundColor = UIColor.init(hexString: "f0f0f0")
        imageX = UIImage.init(named: "ic_back")
        imageX = imageX?.imageWithColor(color1: UIColor.init(hexString: "cccccc"))
        imageX = imageX?.rotate(radians: Float(-CGFloat.pi))
        
        imageY = UIImage.init(named: "ic_back")
        imageY = imageY?.imageWithColor(color1: UIColor.init(hexString: "cccccc"))
        imageY = imageY?.rotate(radians: Float(-CGFloat.pi/2))
        
        self.ivExpand.image = imageX
    }
    
    func expandOrCollapse(_ isCollage: Bool) {
        isCollapse = isCollage
        let image = isCollage ? imageX : imageY
        self.ivExpand.image = image
//        UIView.animate(withDuration: 1) {
//
//            self.onUpdateTableView?()
//        }
    }
    
    @IBAction func onClickExpand(_ sender: Any) {
        onCollapse?(isCollapse)
    }
}
