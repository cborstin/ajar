//
//  ViewController.swift
//  Ajar
//
//  Created by Catherine Borsting on 11/13/15.
//  Copyright (c) 2015 Catherine Borsting. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var LoginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        LoginButton.layer.cornerRadius = 4
        LoginButton.layer.borderWidth = 1
        LoginButton.layer.borderColor = self.view.tintColor.CGColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        //Added comment
    }


}

