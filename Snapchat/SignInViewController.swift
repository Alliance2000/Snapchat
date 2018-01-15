//
//  SignInViewController.swift
//  Snapchat
//
//  Created by Marcus Jessnitz on 14.01.18.
//  Copyright © 2018 Marcus Jessnitz. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase


class SignInViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func turnUpTapped(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion:
            { (user, error) in
                print("##### we tried to sign in #####")
                
                if error != nil {
                    print("##### we have an error while signing in: \(error!) #####")
                    
                    Auth.auth().createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion:
                        { (user, error) in
                        print("##### we tried to create a new user #####")
                            
                        if error != nil {
                            print("##### we have an error creating a new user: \(error!) #####")
                        } else {
                        Database.database().reference().child("users").child(user!.uid).child("email").setValue(user!.email)
                            print("##### user created in the database #####")
                            self.performSegue(withIdentifier: "signinsegue", sender: nil)
                        }
                        })
                    
                } else {
                    print("##### signed in successfully #####")
                    self.performSegue(withIdentifier: "signinsegue", sender: nil)
                }
                
            })
        
    }

}

