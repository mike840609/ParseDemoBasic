//
//  UserAccounts.swift
//  ParseDemo
//
//  Created by 蔡鈞 on 2016/2/17.
//  Copyright © 2016年 mike840609. All rights reserved.
//

import UIKit

class UserAccounts: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        // Dismiss the keyboard
        usernameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    @IBAction func signupTapped(sender: UIButton) {
        
        print("tapped")
        
        //TODO: Check that username & password text field isn't empty
        
        //Sign up new user
        
        let user = PFUser()
        user.username = usernameTextField.text!
        user.password = passwordTextField.text!
        user.signUpInBackgroundWithBlock { (result, error) -> Void in
            
            if error == nil && result == true{
                // user was successful create
                let alert = UIAlertView(title: "Successful", message: "Sign up Successful", delegate: self, cancelButtonTitle: "OK")
                alert.show()

                
            }
            else{
                
                //TODO: Check error message and display the reason to the user
                
                    let alert = UIAlertView(title: "failed", message: "\(error)", delegate: self, cancelButtonTitle: "OK")
                    alert.show()
                

                
            }
        }
        
    }
    
    @IBAction func LoginTapped(sender: UIButton) {
        PFUser.logInWithUsernameInBackground(usernameTextField.text!, password: passwordTextField.text!) { (user, error) -> Void in
            
            if let loggedinUser = user{
                
                // User object isn't nil
                // TODO: User logged in successfully , transition into homepage
                //let alert = UIAlertView(title: "Successful", message: "\(loggedinUser.username) login ", delegate: self, cancelButtonTitle: "OK")
                let alertController = UIAlertController(title: "Successful", message: "\(loggedinUser.username!) login ", preferredStyle: .Alert)
                let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil)
                let okAction = UIAlertAction(title: "好的", style: UIAlertActionStyle.Default, handler: nil)

                alertController.addAction(cancelAction)
                alertController.addAction(okAction)
                
                self.presentViewController(alertController, animated: true, completion: nil)
                
            }
            else{
                
                // User object is nil , check error parameter
                let alert = UIAlertView(title: "Failed", message: "\(error)", delegate: self, cancelButtonTitle: "OK")
                alert.show()
            }
        }
        
    }
    
    
    

}
