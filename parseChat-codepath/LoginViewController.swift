//
//  LoginViewController.swift
//  ParseChat
//
//  Created by Mark Kinoshita on 2/21/18.
//  Copyright © 2018 Mark Kinoshita. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    @IBAction func onSignUp(_ sender: Any) {
        if (usernameField.text?.isEmpty)! || (passwordField.text?.isEmpty)! {
            // Alert controller for missing username/password fields
            let alertController = UIAlertController(title:"Missing Fields Required", message: "Please enter a username and password.", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in}
            alertController.addAction(OKAction)
            present(alertController, animated: true)
            
        } else {
            let newUser = PFUser()
            newUser.username = usernameField.text
            newUser.password = passwordField.text
            
            newUser.signUpInBackground { (success: Bool, error: Error?) in
                if let error = error {
                    // Alert controller for error in Sign Up
                    let alertController = UIAlertController(title:"Error Encountered", message: error.localizedDescription, preferredStyle: .alert)
                    let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in }
                    alertController.addAction(OKAction)
                    self.present(alertController, animated: true)
                    
                } else {
                    print("User Registered successfully")
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                }
            }
            
        }
    }
    
    
    @IBAction func onLogin(_ sender: Any) {
        if (usernameField.text?.isEmpty)! || (passwordField.text?.isEmpty)! {
            // Alert controller for missing username/password fields
            let alertController = UIAlertController(title:"Missing Fields Required", message: "Please enter a username and password.", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                
            }
            alertController.addAction(OKAction)
            present(alertController, animated: true)
            
        } else {
            let username = usernameField.text ?? ""
            let password = passwordField.text ?? ""
            
            PFUser.logInWithUsername(inBackground: username, password: password) { (user: PFUser?, error: Error?) in
                if let error = error {
                    // Alert controller for error in Login
                    let alertController = UIAlertController(title:"Error Encountered", message: error.localizedDescription, preferredStyle: .alert)
                    let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in }
                    alertController.addAction(OKAction)
                    self.present(alertController, animated: true)

                } else {
                    print("User logged in successfully")
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                }
            }

            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
