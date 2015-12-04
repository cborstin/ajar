//
//  AnswerViewController.swift
//  Ajar
//
//  Created by Catherine Borsting on 11/19/15.
//  Copyright (c) 2015 Catherine Borsting. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    var index: Int!
    var response: [Data] = []
    var responseOne:[Data] = []
        /*Data(fname: "NoteWhite", resp: "I am thankful that Sara took her first unassisted step today. :)", name: "Cat", comment: [("Cindy", "dog", "She'll be running around the house and knocking over things before you know it!"), ("Karen", "elephant", "Ahh, what a big milestone. Did you get a video?"), ("Cat", "tiger", "Yes! I'll show you next time we get brunch.")], img: "tiger"),
        Data(fname: "NoteWhite", resp: "I am grateful for the sun and access to coffee and Brian's first word!", name: "Cindy", comment: [("Cat", "tiger", "First words are usually at the end of 6 months, right? Wow, time passes fast."), ("Amy", "cattle", "Shall I drive over just to listen to Brian, I think yes.")], img: "dog"),
        Data(fname: "NoteWhite", resp: "Charlotte made her first friend at preschool!", name: "Karen", comment: [("Cindy", "dog", "Yay for friendship! Btw, we should do playdates soon."), ("Cat", "tiger", "Hey I want in, too!"), ("Cindy", "dog", "Of course, that's a given. ;)")], img: "elephant")
    ]*/
    var responseTwo:[Data] = []
        /*Data(fname: "NoteWhite", resp: "Sara tasted dark chocolate for the first time today. I didn't know her face could pucker up that much.", name: "Cat", comment: [("Cindy", "dog", "HAHAHAH, I'm pretty sure dark chocolate is an acquired taste."), ("Karen", "elephant", "Even I don't like dark chocolate and I'm an adult, please.")], img: "tiger"),
        Data(fname: "NoteWhite", resp: "Brian ran up and down the beach today. So young, so spry.", name: "Cindy", comment: [("Cat", "tiger", "We should really go jogging."), ("Cindy", "dog", "What about the children?"), ("Karen", "elephant", "I mean clearly Brian can run with us, am I right. :)")], img: "dog"),
        Data(fname: "NoteWhite", resp: "Charlotte chased birds at the park and cried because she laughed so hard. :)", name: "Karen", comment: [("Cat", "tiger", "Aww, I love moments like these."), ("Cindy", "dog", "Didn't you used to write poetry in college? You should write one about this."), ("Karen", "elephant", "Shh, Cindy. Shh..")], img: "elephant")
    ]*/

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        if(index == 0){
            questionLabel.text = "What are you grateful for today?"
            response = responseOne
        }
        else{
            questionLabel.text = "What memory would you keep from today?"
            response = responseTwo
        }
        
        let nib = UINib(nibName: "viewTableCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "cell")
        tableView.rowHeight = 220
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Bulb")!)
        self.tableView.backgroundView = nil
        self.tableView.backgroundColor = UIColor.clearColor()
        self.tableView.separatorColor = UIColor.clearColor()
        
        
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.translucent = true
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        
        btnAdd.layer.cornerRadius = 5
        btnAdd.layer.borderWidth = 1
        btnAdd.layer.borderColor = UIColor.whiteColor().CGColor
        
    }
    override func viewDidAppear(animated: Bool) {
        self.tableView.reloadData()
        if let parentView = self.parentViewController {
            if let parentView = parentView as? UINavigationController {
                if let parentView = parentView.viewControllers[0] as? DailyViewController{
                    if(self.index == 0){
                        parentView.responseOne = self.response
                    }
                    else{
                        parentView.responseTwo = self.response
                    }
                    
                }
            }
        }

    }
    

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.response.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //var cell: UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        //cell.textLabel?.text = self.data[indexPath.row]
        var cell:TblCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as! TblCell
        cell.lblResponse.text = response[indexPath.row].response
        cell.imgIcon.image = UIImage(named: response[indexPath.row].icon)
        cell.nameLabel.text = response[indexPath.row].username
        cell.btnComments.tag = indexPath.row
        cell.btnComments.addTarget(self, action: "pressed:", forControlEvents: .TouchUpInside)
        return cell
    }
    
    func pressed(sender: UIButton!) {
        performSegueWithIdentifier("viewCommentsSegue", sender: sender)
        print("Yo")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "viewCommentsSegue" {
            if let commentViewController = segue.destinationViewController as? CommentViewController {
                if let buttonTag = sender as? UIButton{
                    commentViewController.response = response[buttonTag.tag]
                }
                
            }
        }
        
    }
    
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        print("Yo")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func returnFromSegueActions(sender: UIStoryboardSegue){
        
    }
    override func segueForUnwindingToViewController(toViewController: UIViewController, fromViewController: UIViewController, identifier: String?) -> UIStoryboardSegue {
        print("HAY")
        if let id = identifier{
            if id == "idAddAnswerUwindSegue" {
                let unwindSegue = AddAnswerUnwindSegue(identifier: id, source: fromViewController, destination: toViewController, performHandler: { () -> Void in
                    
                })
                return unwindSegue
            }
        }
        
        return super.segueForUnwindingToViewController(toViewController, fromViewController: fromViewController, identifier: identifier)!
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
