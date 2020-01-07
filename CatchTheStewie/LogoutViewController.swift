//
//  LogoutViewController.swift
//  CatchTheStewie
//
//  Created by Emir Kalkan on 25.11.2019.
//  Copyright © 2019 Emir Kalkan. All rights reserved.
//

import UIKit
import Firebase

class LogoutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.navigationBar.topItem?.hidesBackButton = true
    }
    
    @IBAction func logoutClicked(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        } catch {
            print("error")
        }
        performSegue(withIdentifier: "toBackSegue", sender: nil)
    }
}




