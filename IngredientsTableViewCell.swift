//
//  IngredientsTableViewCell.swift
//  InteglassApp
//
//  Created by YotaOdaka on 2015/04/13.
//  Copyright (c) 2015年 YotaOdaka. All rights reserved.
//

import UIKit

class IngredientsTableViewCell: UITableViewCell {
    @IBOutlet weak var ingredientName: UILabel!
    @IBOutlet weak var ingredientVolume: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
