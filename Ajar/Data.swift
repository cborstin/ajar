//
//  Data.swift
//  Ajar
//
//  Created by Catherine Borsting on 11/19/15.
//  Copyright (c) 2015 Catherine Borsting. All rights reserved.
//

import Foundation


class Data {
    class Entry {
        let filename : String
        let heading : String
        init(fname : String, heading : String) {
            self.heading = heading
            self.filename = fname
        }
    }
    
    let places = [
        Entry(fname: "NoteWhite.png", heading: "Response 1"),
        Entry(fname: "NoteWhite.png", heading: "Response 2"),
        Entry(fname: "NoteWhite.png", heading: "Response 3"),
        Entry(fname: "NoteWhite.png", heading: "Response 4")
    ]
    
}