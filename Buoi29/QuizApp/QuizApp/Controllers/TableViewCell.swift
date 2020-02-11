//
//  TableViewCell.swift
//  Quiz
//
//  Created by Quynh on 2/10/20.
//  Copyright © 2020 Quynh. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var selectButton: UIButton!
    @IBOutlet weak var answerLabel: UILabel!
    
    var answer: Answer? {
         didSet{
             if let answer = answer {
                 answerLabel.text = answer.answer
                selectButton.isSelected = answer.isSelected
             }
         }
     }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
