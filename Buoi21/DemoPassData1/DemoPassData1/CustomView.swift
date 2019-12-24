//
//  CustomView.swift
//  DemoPassData1
//
//  Created by Taof on 12/21/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class CustomView: UIView {

    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "3")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let bottomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Rừng tre"
        label.font = UIFont(name: "Lobster-Regular", size: 32)
        label.textAlignment = .left
//        label.font = UIFont.boldSystemFont(ofSize: 32)
        return label
    }()
    
    let favoriteImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "heart")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    func setupLayout(){
        self.addSubview(imageView)
        self.addSubview(bottomView)
        bottomView.addSubview(nameLabel)
        bottomView.addSubview(favoriteImageView)
        
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4).isActive = true
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 4).isActive = true
        imageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -4).isActive = true
        imageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 3/4).isActive = true
        
        bottomView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 4).isActive = true
        bottomView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        bottomView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        bottomView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
        favoriteImageView.rightAnchor.constraint(equalTo: bottomView.rightAnchor, constant: -16).isActive = true
        favoriteImageView.widthAnchor.constraint(equalToConstant: 32).isActive = true
        favoriteImageView.heightAnchor.constraint(equalTo: favoriteImageView.widthAnchor, multiplier: 1).isActive = true
        favoriteImageView.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor).isActive = true
        
        nameLabel.leftAnchor.constraint(equalTo: bottomView.leftAnchor, constant: 16).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: favoriteImageView.leftAnchor, constant: -8).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: favoriteImageView.centerYAnchor).isActive = true
    }
    
    var isFavorite: Bool = false
    
    // tạo biến setData, biến này có thể nil
    var setData: CustomModel? {
        // hàm didSet được gọi khi nhận thấy dữ liệu thay đổi
        didSet{
            if let data = setData {
                imageView.image = UIImage(named: data.nameImage)
                nameLabel.text = data.name
                isFavorite = data.isFavorite
                favoriteImageView.image = isFavorite ? UIImage(named: "heart-fill") : UIImage(named: "heart")
            }
        }
    }
    
    // Bước 1: khai báo một closure
    var passAction: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 2
        setupLayout()
        favoriteImageView.isUserInteractionEnabled = true
        favoriteImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapIcon)))
        
    }
    
    @objc func tapIcon(){
        print("tap icon")
        
        // Bước 2: đăng kí closure
        passAction?()
//        isFavorite.toggle()
//        favoriteImageView.image = isFavorite ? UIImage(named: "heart-fill") : UIImage(named: "heart")
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
