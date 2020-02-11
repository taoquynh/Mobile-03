//
//  CollectionViewCell.swift
//  QuizApp
//
//  Created by Quynh on 2/10/20.
//  Copyright © 2020 Quynh. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var subjectLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.layer.cornerRadius = 10
        subjectLabel.textColor = UIColor(red:0.29, green:0.75, blue:0.65, alpha:1.0)
    }

}
