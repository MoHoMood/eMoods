//
//  FollowerCell.swift
//  MoHoeMoods
//
//  Created by Yixiao Xiao on 4/5/22.
//

import UIKit

class FollowerCell: UITableViewCell {
    
    @IBOutlet weak var profilePhoto: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
