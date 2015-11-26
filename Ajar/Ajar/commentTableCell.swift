//
//  commentTableCell.swift
//  Ajar
//
//  Created by Catherine Borsting on 11/25/15.
//  Copyright © 2015 Catherine Borsting. All rights reserved.
//

import UIKit

class commentTableCell: UITableViewCell {

    @IBOutlet var lblUserName: UILabel!
    @IBOutlet var lblComment: UILabel!
    @IBOutlet var imgIcon: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code


    }
    
    

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
