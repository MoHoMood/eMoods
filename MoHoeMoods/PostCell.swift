//
//  PostCell.swift
//  MoHoeMoods
//
//  Created by Yixiao Xiao on 4/3/22.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var profilePhotoImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
