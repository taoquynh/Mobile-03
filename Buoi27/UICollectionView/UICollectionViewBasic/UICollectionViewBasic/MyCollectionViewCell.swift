//
//  MyCollectionViewCell.swift
//  UICollectionViewBasic
//
//  Created by Taof on 8/26/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    // khởi tạo containerView
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.blue
        return view
    }()
    
    // khởi tạo imageView
    let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "")
        return imageView
    }()
    
    // khởi tạo title
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.textColor = .white
        return label
    }()
    
    func setupLayout(){
        addSubview(containerView)
        containerView.addSubview(photoImageView)
        containerView.addSubview(titleLabel)
        
        containerView.topAnchor.constraint(equalTo: topAnchor, constant: 4).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4).isActive = true
        containerView.leftAnchor.constraint(equalTo: leftAnchor, constant: 4).isActive = true
        containerView.rightAnchor.constraint(equalTo: rightAnchor, constant: -4).isActive = true
        
        titleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 8).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 0).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        photoImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive = true
        photoImageView.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 0).isActive = true
        photoImageView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 0).isActive = true
        photoImageView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 0).isActive = true
    }
    
    // khởi tạo biến food kiểu Foody
    var food: Foody?{
        // câu lệnh bên trong didSet chỉ được gọi khi biến food đã được gán giá trị
        didSet{
            if let food = food {
                photoImageView.image = UIImage(named: food.imageName)
                titleLabel.text = food.name
            }
        }
    }
    
    // khởi tạo cell
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
