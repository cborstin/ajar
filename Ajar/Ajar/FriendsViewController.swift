//
//  FriendsViewController.swift
//  Ajar
//
//  Created by Catherine Borsting on 11/26/15.
//  Copyright © 2015 Catherine Borsting. All rights reserved.
//

import UIKit

class FriendsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet var btnAddFriend: UIButton!
    @IBOutlet var tableView: UITableView!
    var friends = [
        Friend(img: "elephant", name: "Cat", locate: "Los Angeles", age: "1-2"),
        Friend(img: "tiger", name: "Cindy", locate: "New York", age: "2-3"),
        Friend(img: "dog", name: "Karen", locate: "San Francisco", age: "2-4")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let nib = UINib(nibName: "FriendTblCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "friendCell")
        tableView.rowHeight = 100
        tableView.layer.borderWidth = 2.0;
        tableView.layer.borderColor = UIColor.lightGrayColor().CGColor
        btnAddFriend.addTarget(self, action: "pressed:", forControlEvents: .TouchUpInside)
        let footerView =  UIView(frame: CGRectZero)
        tableView.tableFooterView = footerView
        tableView.tableFooterView!.hidden = true
        tableView.backgroundColor = UIColor.clearColor()
    }
    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
    }
    func pressed(sender: UIButton!){
        performSegueWithIdentifier("idAddFriendSegue", sender: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:FriendTableCell = self.tableView.dequeueReusableCellWithIdentifier("friendCell") as! FriendTableCell
        cell.userIcon.image = UIImage(named: friends[indexPath.row].icon)
        cell.userName.text = friends[indexPath.row].username
        cell.backgroundColor = UIColor.clearColor()
        return cell
        
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("Yo")
    }
    
    @IBAction func returnFromSegueActions(sender: UIStoryboardSegue){
        
    }
    override func segueForUnwindingToViewController(toViewController: UIViewController, fromViewController: UIViewController, identifier: String?) -> UIStoryboardSegue {
        if let id = identifier{
            if id == "idAddFriendUnwindSegue" {
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
