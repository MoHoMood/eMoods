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
    var user = PFUser.current()!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
       }
    
    @IBAction func Back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let userId = user.objectId
        let followersRelation = user.relation(forKey: "followers")
        let query = followersRelation.query()
        
        query.findObjectsInBackground{ (followers, error) in
            if followers != nil{
                self.followers = followers!
                self.tableView.reloadData()
            }
        }
        
//        let innerQuery = PFQuery(className: "User")
//        innerQuery.whereKeyExists("username")
//        let query = PFQuery(className: "User")
//        query.whereKey("followers", matchesQuery: innerQuery)
//        query.findObjectsInBackground { ( followers: [PFObject]?, error: Error?) in
//            if let error = error {
//                // The request failed
//                print(error.localizedDescription)
//            } else {
//                // comments now contains the comments for posts with images
//                self.followers = followers!
//                self.tableView.reloadData()
//            }
//        }
        
//        let followers = user.value(forKey: "followers")
//        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return followers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FollowerCell") as! FollowerCell
        
        let follower = followers[indexPath.row]
        let username = follower["username"] as! String
        cell.userNameLabel.text = username
        
        let imageFile = follower["profilePhoto"] as! PFFileObject
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
