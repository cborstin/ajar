//
//  AnswerViewController.swift
//  Ajar
//
//  Created by Catherine Borsting on 11/19/15.
//  Copyright (c) 2015 Catherine Borsting. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    var data: [String] = ["Hello", "Its Me", "I was wondering when you'd like to meet"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        var nib = UINib(nibName: "viewTableCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "cell")
        tableView.rowHeight = 140
        tableView.backgroundView = UIImageView(image: UIImage(named: "Bulb"))
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
        println("Yo")
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
