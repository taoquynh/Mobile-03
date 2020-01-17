//
//  ListModelTableViewCell.swift
//  iOSControl
//
//  Created by Taof on 4/20/19.
//  Copyright © 2019 Tào Quỳnh . All rights reserved.
//

import UIKit

class ListModelTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var feelLabel: UILabel!
    
    var post: Post?{
        didSet{
            if let post = post{
                titleLabel.text = post.title
                feelLabel.text = post.feel
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
