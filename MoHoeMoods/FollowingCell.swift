//
//  FollowingCell.swift
//  MoHoeMoods
//
//  Created by Yixiao Xiao on 4/9/22.
//

import UIKit

class FollowingCell: UITableViewCell {

    @IBOutlet weak var userNameLable: UILabel!
    @IBOutlet weak var profilePhoto: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
