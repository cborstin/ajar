//
//  AddAnswerViewController.swift
//  Ajar
//
//  Created by Catherine Borsting on 11/24/15.
//  Copyright © 2015 Catherine Borsting. All rights reserved.
//

import UIKit

class AddAnswerViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var userText: UITextView!
    @IBOutlet weak var postButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        postButton.addTarget(self, action: "postTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        userText.delegate = self
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "idAddAnswerUnwindSegue" {
            if let answerViewController = segue.destinationViewController as? AnswerViewController {
                let myText = sender as? String
                answerViewController.data.append(myText!)
                answerViewController.icons.append("tiger")
                answerViewController.users.append("Amy")
                
            }
        }
    }
    
    func postTapped(sender: UIButton!) {
        self.performSegueWithIdentifier("idAddAnswerUnwindSegue", sender: userText.text)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
