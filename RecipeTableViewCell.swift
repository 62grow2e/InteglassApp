//
//  RecipeTableViewCell.swift
//  InteglassApp
//
//  Created by YotaOdaka on 2015/04/12.
//  Copyright (c) 2015年 YotaOdaka. All rights reserved.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var explain: UILabel!
    
    var num = 1;
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
