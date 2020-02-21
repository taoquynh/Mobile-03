//
//  BaseViewController.swift
//  BookingVP
//
//  Created by HoangVanDuc on 11/22/19.
//  Copyright © 2019 HoangVanDuc. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class BaseViewController: UIViewController {

    var isShowNavigationBar: Bool = true
    let disponseBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "ic_back")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(onBack))
        
    }
    
    @objc func onBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         self.navigationController?.isNavigationBarHidden = !isShowNavigationBar
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
}

