//
//  LoginViewController.swift
//  Ajar
//
//  Created by Catherine Borsting on 11/18/15.
//  Copyright (c) 2015 Catherine Borsting. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
   
    @IBOutlet weak var BackgroundLabel: UILabel!
    @IBOutlet weak var UserText: UITextField!
    @IBOutlet weak var LoginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        LoginButton.layer.cornerRadius = 4
        BackgroundLabel.layer.cornerRadius = 4
        BackgroundLabel.layer.borderWidth = 1
        LoginButton.layer.borderWidth = 1
        LoginButton.layer.borderColor = self.view.tintColor.CGColor

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        //Added comment
    }

}
