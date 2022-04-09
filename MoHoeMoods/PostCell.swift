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
        
        
        
    

    


    
    @IBOutlet weak var shareButton: UIButton!
    
    var shared:Bool = false
    
    @IBAction func sharePost(_ sender: Any) {

        
        let tobeShared = !shared
        if (tobeShared){
            
                self.setShared(true)
           
            } else {
            self.setShared(false)
            }
        
        
        
    }
    
    
    
    
    func setFavorite(_ isFavorited:Bool) {
        favorited = isFavorited
        if (favorited){
            favButton.setImage(UIImage(named:"favor-icon-red"), for:
                                UIControl.State.normal)
                               }
        else{
            favButton.setImage(UIImage(systemName: "heart"), for:
                                UIControl.State.normal)
    
        }
    }
    
    func setShared(_ isShared:Bool) {
        shared = isShared
        if (shared){
            shareButton.setImage(UIImage(systemName:"arrowshape.turn.up.right.fill"), for:
                                UIControl.State.normal)
                               }
        else{
            shareButton.setImage(UIImage(systemName: "arrowshape.turn.up.right"), for:
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
