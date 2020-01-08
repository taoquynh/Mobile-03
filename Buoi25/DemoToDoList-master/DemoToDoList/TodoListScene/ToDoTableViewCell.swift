//
//  ToDoTableViewCell.swift
//  DemoToDoList
//
//  Created by Hoang Tung on 1/6/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    let phoneLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
    
    let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = UIScreen.main.bounds.maxX / 10
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    var todo: User? {
        didSet {
            if let data = todo {
                nameLabel.text = data.name
                phoneLabel.text = data.phone
                avatarImageView.image = data.image
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            containerView.backgroundColor = .systemBlue
        } else {
            containerView.backgroundColor = .white
        }
        
        addUIComponents()
        setupLayout()
    }

    func addUIComponents() {
        self.addSubview(containerView)
        self.addSubview(nameLabel)
        self.addSubview(phoneLabel)
        self.addSubview(avatarImageView)
    }
    
    func setupLayout() {
        containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
        avatarImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8).isActive = true
        avatarImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8).isActive = true
        avatarImageView.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.2).isActive = true
        avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor, multiplier: 1).isActive = true
        avatarImageView.bottomAnchor.constraint(lessThanOrEqualTo: containerView.bottomAnchor, constant: -8).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor, constant: 0).isActive = true
        nameLabel.leadingAnchor.constraint(lessThanOrEqualTo: avatarImageView.trailingAnchor, constant: 16).isActive = true
        nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: containerView.trailingAnchor, constant: -8).isActive = true
        nameLabel.heightAnchor.constraint(lessThanOrEqualTo: avatarImageView.heightAnchor, multiplier: 0.5).isActive = true
        
        phoneLabel.topAnchor.constraint(equalTo: avatarImageView.centerYAnchor, constant: 0).isActive = true
        phoneLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor, constant: 0).isActive = true
        phoneLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8).isActive = true
        phoneLabel.bottomAnchor.constraint(lessThanOrEqualTo: containerView.bottomAnchor, constant: -8).isActive = true
    }
}
