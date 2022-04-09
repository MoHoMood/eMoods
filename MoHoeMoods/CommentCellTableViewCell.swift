//
//  CommentCellTableViewCell.swift
//  MoHoeMoods
//
//  Created by Ruby Sapkota on 4/9/22.
//

import UIKit

class CommentCellTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    @IBOutlet weak var commentLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
