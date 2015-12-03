//
//  AddAnswerViewController.swift
//  Ajar
//
//  Created by Catherine Borsting on 11/24/15.
//  Copyright © 2015 Catherine Borsting. All rights reserved.
//

import UIKit

class AddAnswerViewController: UIViewController, UITextViewDelegate {

    @IBOutlet var btnCancel: UIButton!
    @IBOutlet weak var userText: UITextView!
    @IBOutlet weak var postButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        postButton.addTarget(self, action: "postTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        postButton.addTarget(self, action: "cancelTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        userText.delegate = self
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.translucent = true
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "idAddAnswerUnwindSegue" {
            if let answerViewController = segue.destinationViewController as? AnswerViewController {
                if let myText = sender as? String{
                    let newResponse = Data(fname: "NoteWhite", resp: myText, name: "Amy", comment: [], img: "tiger")
                    answerViewController.response.append(newResponse)
                }
                
            }
        }
    }
    
    func postTapped(sender: UIButton!) {
        self.performSegueWithIdentifier("idAddAnswerUnwindSegue", sender: userText.text)
    }
    func cancelTapped(sender: UIButton!) {
        self.performSegueWithIdentifier("idAddAnswerUnwindSegue", sender: nil)
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
