//
//  CustomCell2.swift
//  CustomCellTableView
//
//  Created by Taof on 12/31/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class CustomCell2: UITableViewCell {

    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.purple
        return view
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        setupLayout()
    }
    
    func setupLayout(){
        self.addSubview(containerView)
        
        containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4).isActive = true
        containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4).isActive = true
    }
}
