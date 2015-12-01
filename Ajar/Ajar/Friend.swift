//
//  Friend.swift
//  Ajar
//
//  Created by Catherine Borsting on 11/26/15.
//  Copyright © 2015 Catherine Borsting. All rights reserved.
//

import Foundation

class Friend {
    let icon : String
    let username: String
    let location: String
    let ages: String
    init(img : String, name : String, locate: String, age: String) {
        self.icon = img
        self.username = name
        self.location = locate
        self.ages = age
    }
    
}