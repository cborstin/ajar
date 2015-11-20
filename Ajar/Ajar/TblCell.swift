//
//  TblCell.swift
//  Ajar
//
//  Created by Catherine Borsting on 11/19/15.
//  Copyright (c) 2015 Catherine Borsting. All rights reserved.
//

import UIKit

class TblCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var imgIcon: UIImageView!
    @IBOutlet var lblResponse: UILabel!
    @IBOutlet var imgBackground: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = UIColor.clearColor()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
