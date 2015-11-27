//
//  FriendTableCell.swift
//  Ajar
//
//  Created by Catherine Borsting on 11/26/15.
//  Copyright © 2015 Catherine Borsting. All rights reserved.
//

import UIKit

class FriendTableCell: UITableViewCell {

    @IBOutlet var userIcon: UIImageView!
    @IBOutlet var userName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
   
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
