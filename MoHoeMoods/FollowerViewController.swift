//
//  FollowerViewController.swift
//  MoHoeMoods
//
//  Created by Yixiao Xiao on 4/5/22.
//

import UIKit
import AlamofireImage
import Parse

class FollowerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var followers = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
       }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let query = PFQuery(className: "Posts")
        query.includeKey("author")
        query.limit = 20
        query.order(byDescending: "createdAt")
        
        query.findObjectsInBackground{ (followers, error) in
            if followers != nil{
                self.followers = followers!
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return followers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FollowerCell") as! FollowerCell
        
        let follower = followers[indexPath.row]
        let user = follower["author"] as! PFUser
        cell.userNameLabel.text = user.username
        
        let imageFile = user["profilePhoto"] as! PFFileObject
        let urlString = imageFile.url!
        let url = URL(string: urlString)!
        
        cell.profilePhoto.af.setImage(withURL: url)
        
        return cell
        
    }
    
        
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
