//
//  SignUpViewController.swift
//  MoHoeMoods
//
//  Created by Yixiao Xiao on 3/27/22.
//

import UIKit
import Parse
import Lottie

class SignUpViewController: UIViewController {


    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    
    var animationView: AnimationView?
    override func viewDidLoad() {
        super.viewDidLoad()
        startAnimation()
        
        animationView = .init(name: "13331-emotions")
           animationView?.frame = view.bounds
           animationView?.play()
        
        //view.addSubview(animationView!)
        
        

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onSignUp(_ sender: Any) {
    
    let user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        user.email = emailField.text!
        user.signUpInBackground(){ (success, error) in
            if success {
                self.performSegue(withIdentifier: "SignUpSegue", sender: nil)
            } else {
                print("Error: \(error?.localizedDescription)")
            }
            
        }
    }
    
    
    func startAnimation(){
        animationView = .init(name: "13331-emotions")
        animationView!.frame = CGRect (x: view.frame.width / 5 , y: view.frame.height / 7.3 , width:250, height:250)
        
        animationView!.contentMode = .scaleAspectFit
        view.addSubview(animationView!)
        
        animationView!.loopMode = .loop
        
        animationView!.animationSpeed = 1.5
        
        
        animationView!.play()
        
        
    
        
        
        
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
