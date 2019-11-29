//
//  ImageCell.swift
//  CatchTheStewie
//
//  Created by Emir Kalkan on 25.11.2019.
//  Copyright © 2019 Emir Kalkan. All rights reserved.
//

import UIKit

class ImageCell: UITableViewCell {

    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
