//
//  NewPostViewController.swift
//  MoHoeMoods
//
//  Created by Ruby Sapkota on 3/30/22.
//

import UIKit
import AlamofireImage
import Parse

class NewPostViewController: UIViewController {

    
    
    @IBOutlet weak var emojiTextField: UITextField!
    
    @IBOutlet weak var captionView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onSubmitButton(_ sender: Any) {
        let post = PFObject(className: "Posts")
        
        post["emoji"] = emojiTextField.text!
        post["caption"] = captionView.text!
        post["author"] = PFUser.current()!
        
        post.saveInBackground {
            (success, error) in
            if success {
                self.dismiss(animated: true, completion: nil)
                print("saved")
            } else {
                print("error")
            }
        }
    }
}
