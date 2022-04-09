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
    
    
    
    @IBOutlet weak var favButton: UIButton!
    var favorited:Bool = false
    
    @IBAction func favoritePost(_ sender: Any) {
        
        let tobeFavorited = !favorited
        if (tobeFavorited){
            
                self.setFavorite(true)
           
            } else {
            self.setFavorite(false)
            }
        }
        
        
        
    

    
    @IBOutlet weak var commentButton: UIButton!
    
    @IBAction func commentPost(_ sender: Any) {
    }
    
    @IBOutlet weak var shareButton: UIButton!
    
    
    @IBAction func sharePost(_ sender: Any) {
    }
    
    
    
    
    func setFavorite(_ isFavorited:Bool) {
        favorited = isFavorited
        if (favorited){
            favButton.setImage(UIImage(named:"favor-icon-red"), for:
                                UIControl.State.normal)
                               }
        else{
            favButton.setImage(UIImage(systemName: "heart.fill"), for:
                                UIControl.State.normal)
    
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
