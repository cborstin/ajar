//
//  AnswerViewController.swift
//  Ajar
//
//  Created by Catherine Borsting on 11/19/15.
//  Copyright (c) 2015 Catherine Borsting. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    var index: Int!
    var data: [String] = ["Hello", "Its Me", "I was wondering when you'd like to meet"]
    var users: [String] = ["Cat", "Cindy", "Karen"]
    var icons: [String] = ["tiger", "dog", "elephant"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        if(index == 0){
            questionLabel.text = "What are you grateful for today?"
            data = ["I am thankful that Sara took her first unassisted step today. :)", "I am grateful for the sun and access to coffee and Brian's first word!", "Charlotte made her first friend at preschool!"]
        }
        else{
            questionLabel.text = "What memory would you keep from today?"
            data = ["Sara tasted dark chocolate for the first time today. I didn't know her face could pucker up that much.", "Brian ran up and down the beach today. So young, so spry.", "Charlotte chased birds at the park and cried because she laughed so hard. :)"]
        }
        
        var nib = UINib(nibName: "viewTableCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "cell")
        tableView.rowHeight = 220
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Bulb")!)
        self.tableView.backgroundView = nil
        self.tableView.backgroundColor = UIColor.clearColor()
        self.tableView.separatorColor = UIColor.clearColor()
        
        
    }
    

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //var cell: UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        //cell.textLabel?.text = self.data[indexPath.row]
        var cell:TblCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as! TblCell
        cell.lblResponse.text = data[indexPath.row]
        cell.imgIcon.image = UIImage(named: icons[indexPath.row])
        cell.nameLabel.text = users[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        print("Yo")
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
