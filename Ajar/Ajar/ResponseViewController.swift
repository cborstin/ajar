//
//  ResponseViewController.swift
//  Ajar
//
//  Created by Catherine Borsting on 11/18/15.
//  Copyright (c) 2015 Catherine Borsting. All rights reserved.
//

import UIKit

class ResponseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //var tableView: UITableView  =   UITableView()
    var items: [String] = ["We", "Heart", "Swift"]
    
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableView.frame         =   CGRectMake(0, 50, 320, 200)
         //tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
         //self.view.addSubview(tableView)
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        
        cell.textLabel?.text = self.items[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("You selected cell #\(indexPath.row)!")
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
