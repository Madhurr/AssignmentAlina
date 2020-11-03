//
//  TrendingCell.swift
//  AlinaAssignment
//
//  Created by madhur on 03/11/20.
//  Copyright © 2020 Madhur. All rights reserved.
//

import UIKit

class TrendingCell: UITableViewCell {

    @IBOutlet weak var brandNameLabel: UILabel!
    @IBOutlet weak var brandLogo: UIImageView!
    @IBOutlet weak var shortName: UILabel!
    @IBOutlet weak var valueView: UIView!
    @IBOutlet weak var val: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
