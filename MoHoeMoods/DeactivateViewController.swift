//
//  DeactivateViewController.swift
//  MoHoeMoods
//
//  Created by Ruby Sapkota on 3/30/22.
//

import UIKit
import Parse

class DeactivateViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func Yes(_ sender: Any) {
        deleteUser()
        self.performSegue(withIdentifier: "mainSegue", sender: nil)
        var user = PFUser.current()
        user?.deleteEventually()
    }
    
    @IBAction func Back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func No(_ sender: Any) {
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
    func deletePosts(){
        var user = PFUser.current()
        let query = PFQuery(className: "Posts")
        query.whereKey("author", equalTo: user)
        query.findObjectsInBackground { (objects, error) in
            if let error = error {
                // Log details of the failure
                print(error.localizedDescription)
            } else if let objects = objects {
                // The find succeeded.
                // Do something with the found objects
                for object in objects {
                        object.deleteInBackground()
                }
            }
        }
    }
    
    func deleteComments(){
        var user = PFUser.current()
        let query = PFQuery(className: "Comments")
        query.whereKey("author", equalTo: user)
        query.findObjectsInBackground { (objects, error) in
            if let error = error {
                // Log details of the failure
                print(error.localizedDescription)
            } else if let objects = objects {
                // The find succeeded.
                // Do something with the found objects
                for object in objects {
                        object.deleteInBackground()
                }
            }
        }
    }
    
    func deleteUser(){
        deleteComments()
        deletePosts()
    }

}
