//
//  Data.swift
//  Ajar
//
//  Created by Catherine Borsting on 11/19/15.
//  Copyright (c) 2015 Catherine Borsting. All rights reserved.
//

import Foundation


class Data {
    let filename : String
    let username: String
    let response : String
    let icon: String
    var comments: [(String, String, String)]
    init(fname : String, resp : String, name: String, comment: [(String, String, String)], img: String) {
        self.response = resp
        self.filename = fname
        self.username = name
        self.comments = comment
        self.icon = img
    }
    func getResponse()->String{
        return self.response
    }
    
}