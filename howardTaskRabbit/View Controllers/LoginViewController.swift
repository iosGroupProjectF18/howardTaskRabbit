//
//  LoginViewController.swift
//  howardTaskRabbit
//
//  Created by Shrijan Aryal on 10/20/18.
//  Copyright © 2018 Whitney Griffith. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        let newUser = PFUser()
        newUser.username = usernameField.text
        newUser.password = passwordField.text
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if success{
                print ("Created a new User!")
            }
            else{
                print(error?.localizedDescription)
            }
        }
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        PFUser.logInWithUsername(inBackground: usernameField.text!, password: passwordField.text! ) {(user: PFUser?, error: Error?) in
            if user != nil{
                print ("user is logged in")
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
