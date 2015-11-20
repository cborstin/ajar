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
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        if(index == 0){
            questionLabel.text = "What are you grateful for today?"
            data = ["Hello", "Its Me", "I was wondering when you'd like to meet"]
        }
        else{
            questionLabel.text = "What memory would you keep from today?"
            data = ["Words", "More words", "Insert all the words here"]
        }
        
        var nib = UINib(nibName: "viewTableCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "cell")
        tableView.rowHeight = 140
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
