//
//  AddFriendTableCell.swift
//  Ajar
//
//  Created by Catherine Borsting on 11/30/15.
//  Copyright © 2015 Catherine Borsting. All rights reserved.
//

import UIKit

class AddFriendTableCell: UITableViewCell {

    @IBOutlet var imgIcon: UIImageView!
    @IBOutlet var lblUsername: UILabel!
    @IBOutlet var btnAdd: UIButton!
    
    @IBOutlet var lblAges: UILabel!
    @IBOutlet var lblLocation: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       /* self.btnAdd.layer.cornerRadius = 5
        self.btnAdd.layer.borderWidth = 1
        self.btnAdd.layer.borderColor = UIColor.lightGrayColor().CGColor*/
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
