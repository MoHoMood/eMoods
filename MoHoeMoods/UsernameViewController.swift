//
//  UsernameViewController.swift
//  MoHoeMoods
//
//  Created by Ruby Sapkota on 3/30/22.
//

import UIKit
import Parse

class UsernameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
   
        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var newUsername: UITextField!
    
    var user = PFUser.current()!
    
    
    @IBAction func Save(_ sender: Any) {
        if (newUsername.text != nil) {
            var user = PFUser.current()!
            user.username = newUsername.text!
            user.saveInBackground()
        }
        dismiss(animated: true, completion: nil)
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
