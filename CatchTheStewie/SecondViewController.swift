//
//  SecondViewController.swift
//  CatchTheStewie
//
//  Created by Emir Kalkan on 19.11.2019.
//  Copyright © 2019 Emir Kalkan. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    
    var selectedGriffin : Griffins?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = selectedGriffin?.name
        jobLabel.text = selectedGriffin?.job
        imageView.image = selectedGriffin?.image
    }

}
