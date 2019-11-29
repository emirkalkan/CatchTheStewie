//
//  ViewController.swift
//  CatchTheStewie
//
//  Created by Emir Kalkan on 18.11.2019.
//  Copyright © 2019 Emir Kalkan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signUpClicked(_ sender: Any) {
        performSegue(withIdentifier: "toSignUpSegue", sender: nil)
    }
    @IBAction func loginClicked(_ sender: Any) {
        performSegue(withIdentifier: "toLoginSegue", sender: nil)
    }
    
}

