//
//  CommentViewController.swift
//  Ajar
//
//  Created by Catherine Borsting on 11/25/15.
//  Copyright © 2015 Catherine Borsting. All rights reserved.
//

import UIKit

class CommentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var addCommentText: UITextField!
    @IBOutlet var btnPost: UIButton!
    @IBOutlet var tableView: UITableView!
    var users:[String] = ["Cindy", "Cat", "Karen"]
    var icons: [String] = ["tiger", "dog", "elephant"]
    var response:Data!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var nib = UINib(nibName: "viewTableCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "cell")
        var nib2 = UINib(nibName: "commentTblCell", bundle: nil)
        tableView.registerNib(nib2, forCellReuseIdentifier: "commentCell")
        tableView.rowHeight = 100
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Bulb")!)
        self.tableView.backgroundView = nil
        self.tableView.backgroundColor = UIColor.clearColor()
        self.tableView.separatorColor = UIColor.clearColor()
        btnPost.addTarget(self, action: "postPressed:", forControlEvents: .TouchUpInside)
        
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.translucent = true
        self.tabBarController?.tabBar.hidden = true
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
    }
    func postPressed(sender: AnyObject?) {
        //Data: (fname : String, resp : String, name: String, comment: [(String, String, String)], img: String)
        let userInput = addCommentText.text
        response.comments.append(("Amy", "elephant", userInput!))
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return response.comments.count
    }
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var cell:TblCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as! TblCell
        cell.lblResponse.text = response.response
        cell.imgIcon.image = UIImage(named: response.icon)
        cell.nameLabel.text = response.username
        cell.btnComments.setTitle("", forState: .Normal)
        cell.btnComments.setTitle("", forState: .Selected)
        return cell
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 205
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:commentTableCell = self.tableView.dequeueReusableCellWithIdentifier("commentCell") as! commentTableCell
        cell.imgIcon.image = UIImage(named: response.comments[indexPath.row].1)
        cell.lblComment.text = response.comments[indexPath.row].2
        cell.lblUserName.text = response.comments[indexPath.row].0
        cell.backgroundColor = UIColor.clearColor()
        return cell
    
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        print("Yo")
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
