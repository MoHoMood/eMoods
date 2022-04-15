//
//  UserPostViewController.swift
//  MoHoeMoods
//
//  Created by Yixiao Xiao on 4/15/22.
//

import UIKit
import Parse
import Foundation

class UserPostViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var tableView: UITableView!
    
    var pastPosts = [PFObject]()
    var user = PFUser.current()!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let queryPost = PFQuery(className: "Posts")
        queryPost.whereKey("author", equalTo: user)
        
        queryPost.findObjectsInBackground { (objects, error) in
            if let error = error {
                // Log details of the failure
                print(error.localizedDescription)
            } else {
                self.pastPosts = objects!
                self.tableView.reloadData()
            }
        }
        
    }
    
    @IBAction func Back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pastPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PastCell") as! PastCell
        
        let post = pastPosts[indexPath.row]
        let emoji = post["emoji"] as! String
        cell.emojiLabel.text = emoji

        let caption = post["caption"] as! String
        cell.captionLabel.text = caption
        
        let date = post.createdAt! as Date
        // Create Date Formatter
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YY/MM/dd"
        cell.timeLabel.text = dateFormatter.string(from: date)
        
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
