//
//  LoginViewController.swift
//  MoHoeMoods
//
//  Created by Yixiao Xiao on 3/26/22.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var alertView: UILabel!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onLogin(_ sender: Any) {
        let username = usernameField.text!
        let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password){ (user: PFUser?, error: Error?) -> Void in
            if user != nil{
                self.performSegue(withIdentifier: "LoginSegue", sender: nil)
            } else {
                if error?.localizedDescription == "Invalid username/password." {
                    self.alertView.text = "Invalid username/password.\nPlease check your username/password or sign up for a new account."
                } else {
                    self.alertView.text = "Error: \(error?.localizedDescription)"
                }
            }
        }
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
