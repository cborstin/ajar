//
//  NoteViewCell.swift
//  Ajar
//
//  Created by Catherine Borsting on 11/19/15.
//  Copyright (c) 2015 Catherine Borsting. All rights reserved.
//

import UIKit

class NoteViewCell: UITableViewCell {

    @IBOutlet var BackgroundNote: UIImageView!
    @IBOutlet var ResponseText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setCell(backgroundNote: UIImage, text: String){
        self.BackgroundNote.image = backgroundNote
        self.ResponseText.text = text
        
    }

}
