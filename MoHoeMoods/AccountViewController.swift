//
//  AccountViewController.swift
//  MoHoeMoods
//
//  Created by Ruby Sapkota on 3/27/22.
//

import UIKit
import Parse
import AlamofireImage
import MessageInputBar


class AccountViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
        }
           
           
    
    @IBAction func onLogoutButton(_ sender: Any) {
    
    
    PFUser.logOut()
    
    let main = UIStoryboard(name: "Main", bundle:nil)
    let loginViewController = main.instantiateViewController(withIdentifier: "LoginViewController")
    guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene , let delegate = windowScene.delegate as? SceneDelegate else {return}
    delegate.window?.rootViewController = loginViewController
    }
    
    
    
    
    
    
    
}
    
    
    
    
    
       

        // Do any additional setup after loading the view.
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


