//
//  SignUpViewController.swift
//  CatchTheStewie
//
//  Created by Emir Kalkan on 18.11.2019.
//  Copyright © 2019 Emir Kalkan. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var confirmPasswordText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        passwordText.isSecureTextEntry = true
        confirmPasswordText.isSecureTextEntry = true
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        
        if  emailText.text != "" && passwordText.text != "" && confirmPasswordText.text != "" {
            if confirmPasswordText.text != passwordText.text {
                makeAlert(titleInput: "Error!", messageInput: "Passwords not match.")
            } else {
                Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { (authData, error) in
                    if error != nil {
                        self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error")
                    } else {
                        self.performSegue(withIdentifier: "signPlaySegue", sender: nil)
                    }
                }
            }
            
        } else {
            makeAlert(titleInput: "Error!", messageInput: "Please fill: \n*E-mail Address\n*Password\n*Confirm Password")
        }
    }
    
    func makeAlert(titleInput: String, messageInput: String) {
         let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
         let okButon = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
         alert.addAction(okButon)
         self.present(alert, animated: true, completion: nil)
    }
    
    
}
