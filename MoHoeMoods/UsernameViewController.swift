//
//  UsernameViewController.swift
//  MoHoeMoods
//
//  Created by Ruby Sapkota on 3/30/22.
//

import UIKit

class UsernameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
   
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var currentUsername: UITextField!
    
    @IBOutlet weak var newUsername: UITextField!
    
    
    
    @IBAction func Save(_ sender: Any) {
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
