//
//  FollowingViewController.swift
//  MoHoeMoods
//
//  Created by Yixiao Xiao on 4/5/22.
//

import UIKit
import Parse
import AlamofireImage

class FollowingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var followings = [PFObject]()
    var user = PFUser.current()!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let userId = user.objectId
        let followingsRelation = user.relation(forKey: "following")
        let query = followingsRelation.query()
        
        query.findObjectsInBackground{ (followings, error) in
            if followings != nil{
                self.followings = followings!
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return followings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FollowingCell") as! FollowingCell
        
        let following = followings[indexPath.row]
        let username = following["username"] as! String
        cell.userNameLable.text = username
        
        let imageFile = following["profilePhoto"] as! PFFileObject
        let urlString = imageFile.url!
        let url = URL(string: urlString)!
        
        cell.profilePhoto.af.setImage(withURL: url)
        
        return cell
        
    }
    

    @IBAction func Back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
