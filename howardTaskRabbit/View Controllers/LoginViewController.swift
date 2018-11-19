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
    func validateUserName() -> Bool {
        var name = usernameField.text as! String;
        if let number = name.index(of: "@"){
            if name[number...] == "@bison.howard.edu"{return true}
        }
        return false
    }
    
    func presentAlert(title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (UIAlertAction) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert,animated: true, completion: nil)
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        
        if validateUserName() == false{
            presentAlert(title: "Invalid Email", message: "Please enter HU Email Address")
        }
            
        else{
            let newUser = PFUser()
            newUser.username = usernameField.text
            newUser.password = passwordField.text
            
            newUser.signUpInBackground { (success: Bool, error: Error?) in
                if success{
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                    print ("Created a new User!")
                }
                else{
                    print(error?.localizedDescription)
                }
            }
        }
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        
        if validateUserName() == false{
            presentAlert(title: "Invalid Email", message: "Please enter HU Email Address")
        }
        else{
            PFUser.logInWithUsername(inBackground: usernameField.text!, password: passwordField.text! ) {(user: PFUser?, error: Error?) in
                if user != nil{
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                    print ("user is logged in")
                }
                
            }
        }
    }
}
