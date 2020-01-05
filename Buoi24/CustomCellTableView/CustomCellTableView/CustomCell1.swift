//
//  CustomCell1.swift
//  CustomCellTableView
//
//  Created by Taof on 12/31/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class CustomCell1: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var checkImageView: UIImageView!
    
    var food: Food?{
        didSet{
            if let data = food {
                photoImageView.image = UIImage(named: data.imageName)
                nameLabel.text = data.name
                descriptionLabel.text = data.description
                checkImageView.image = UIImage(named: data.isSelected ? "checked" : "unchecked")
            }
        }
    }
    
    var passAction: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.backgroundColor = UIColor.clear
        
        checkImageView.isUserInteractionEnabled = true  
        let gesture = UITapGestureRecognizer(target: self, action: #selector(changeSelect))
        checkImageView.addGestureRecognizer(gesture)
    }
    
    @objc func changeSelect(){
        passAction?()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
