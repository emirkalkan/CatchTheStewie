//
//  LoginViewController.swift
//  CatchTheStewie
//
//  Created by Emir Kalkan on 18.11.2019.
//  Copyright © 2019 Emir Kalkan. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
        passwordText.isSecureTextEntry = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.navigationBar.topItem?.hidesBackButton = true
    }
    
    @IBAction func loginClicked(_ sender: Any) {
        
        if emailText.text != "" && passwordText.text != "" {
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { (authData, error) in
                if error != nil {
                    self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error")
                } else {
                    self.performSegue(withIdentifier: "loginPlaySegue", sender: nil)
                }
            }
        } else {
            makeAlert(titleInput: "Error!", messageInput: "Please fill: \n*E-mail Address\n*Password")
        }
    }
    
    func makeAlert(titleInput: String, messageInput: String) {
         let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
         let okButon = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
         alert.addAction(okButon)
         self.present(alert, animated: true, completion: nil)

    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        passwordText.resignFirstResponder() //for dismiss keyboarda
        emailText.resignFirstResponder()
    }
}
