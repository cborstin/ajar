//
//  FriendsViewController.swift
//  Ajar
//
//  Created by Catherine Borsting on 11/26/15.
//  Copyright © 2015 Catherine Borsting. All rights reserved.
//

import UIKit

class FriendsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet var tableView: UITableView!
    let friends = [
        Friend(img: "elephant", name: "Cat"),
        Friend(img: "tiger", name: "Cindy"),
        Friend(img: "dog", name: "Karen")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var nib = UINib(nibName: "FriendTblCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "friendCell")
        tableView.rowHeight = 100
        tableView.layer.borderWidth = 2.0;
        tableView.layer.borderColor = UIColor.lightGrayColor().CGColor
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:FriendTableCell = self.tableView.dequeueReusableCellWithIdentifier("friendCell") as! FriendTableCell
        cell.userIcon.image = UIImage(named: friends[indexPath.row].icon)
        cell.userName.text = friends[indexPath.row].username
        cell.backgroundColor = UIColor.clearColor()
        return cell
        
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
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
