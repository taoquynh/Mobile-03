//
//  ViewController.swift
//  DemoPassData1
//
//  Created by Taof on 12/21/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var topView = CustomView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        
        // layout
        topView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        topView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32).isActive = true
        topView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32).isActive = true
        topView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        // tạo dữ liệu
        var data1: CustomModel? = CustomModel(nameImage: "he", name: "Hoa Phượng", isFavorite: true)
        
        // đổ dữ liệu vào view: cách 1 (cách này k hay, hạn chế dùng)
//        topView.imageView.image = UIImage(named: data1.nameImage)
//        topView.nameLabel.text = data1.name
//        topView.isFavorite = data1.isFavorite
//        topView.favoriteImageView.image = data1.isFavorite ? UIImage(named: "heart-fill") : UIImage(named: "heart")
        
        // đổ dữ liệu vào view: cách 2 (cách này dùng hay hơn)
        topView.setData = data1
        data1 = nil
        
        // Bước 3: gọi closure ở đây
        topView.passAction = { [weak self] in
            guard let new = self else { return }
            data1?.isFavorite.toggle()
            new.topView.setData = data1
            print(new.topView.nameLabel.text)
        }
    }


}

