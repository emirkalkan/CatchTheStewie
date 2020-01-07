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
        //navigationController?.navigationBar.topItem?.hidesBackButton = true //for hiding back button
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func playClicked(_ sender: Any) {
        performSegue(withIdentifier: "toGameSegue", sender: nil)
    }
}
