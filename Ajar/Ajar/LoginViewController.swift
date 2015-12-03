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
        LoginButton.layer.borderWidth = 1
        LoginButton.layer.borderColor = self.view.tintColor.CGColor
        BackgroundLabel.layer.cornerRadius = 4
        BackgroundLabel.layer.borderWidth = 4
        BackgroundLabel.layer.borderColor = UIColor.whiteColor().CGColor
        BackgroundLabel.layer.shadowOffset = CGSize(width: 1, height: 1)
        BackgroundLabel.layer.shadowOpacity = 0.5
        BackgroundLabel.layer.shadowRadius = 2
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)

    }
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        //Added comment
    }

}
