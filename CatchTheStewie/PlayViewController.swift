//
//  PlayViewController.swift
//  CatchTheStewie
//
//  Created by Emir Kalkan on 19.11.2019.
//  Copyright © 2019 Emir Kalkan. All rights reserved.
//

import UIKit
import FirebaseAuth

class PlayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func playClicked(_ sender: Any) {
        performSegue(withIdentifier: "toGameSegue", sender: nil)
    }
    
    @IBAction func familyClicked(_ sender: Any) {
        performSegue(withIdentifier: "toFamilySegue", sender: nil)
    }
    
    @IBAction func uploadClicked(_ sender: Any) {
        performSegue(withIdentifier: "toUploadSegue", sender: nil)
    }
    
    @IBAction func goPicturesClicked(_ sender: Any) {
        performSegue(withIdentifier: "toPicturesSegue", sender: nil)
    }
    
    @IBAction func logoutClicked(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        } catch {
            print("error")
        }
        performSegue(withIdentifier: "toLogoutSegue", sender: nil)
    }
    
}
