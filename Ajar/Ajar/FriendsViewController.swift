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
    
    var potentialFriends = [
        Friend(img: "sheep", name: "Rachel", locate: "Chicago", age: "1 child"),
        Friend(img: "giraffe", name: "Nathan", locate: "London", age: "2 children"),
        Friend(img: "hippopotamus", name: "Griffin", locate: "Sacramento", age: "1 child")
    ]
    var friends = [
        Friend(img: "tiger", name: "Cat", locate: "Los Angeles", age: "4 children"),
        Friend(img: "dog", name: "Cindy", locate: "New York", age: "2 children"),
        Friend(img: "elephant", name: "Karen", locate: "San Francisco", age: "1 child")    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let nib = UINib(nibName: "FriendTblCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "friendCell")
        tableView.rowHeight = 100
        tableView.layer.borderWidth = 2.0;
        tableView.layer.borderColor = UIColor.lightGrayColor().CGColor
        btnAddFriend.layer.cornerRadius = 5
        btnAddFriend.layer.borderWidth = 1
        btnAddFriend.layer.borderColor = UIColor.whiteColor().CGColor
        btnAddFriend.addTarget(self, action: "pressed:", forControlEvents: .TouchUpInside)
        let footerView =  UIView(frame: CGRectZero)
        tableView.tableFooterView = footerView
        tableView.tableFooterView!.hidden = true
        tableView.backgroundColor = UIColor.clearColor()
        
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.translucent = true
    }
    
    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    func pressed(sender: UIButton!){
        performSegueWithIdentifier("idAddFriendSegue", sender: nil)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "idAddFriendSegue"{
            if let addFriendViewController = segue.destinationViewController as? AddFriendViewController{
                addFriendViewController.friends = potentialFriends
            }
        }
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
        cell.lblUsernameInput.text = friends[indexPath.row].location
        cell.lblAgeInput.text = friends[indexPath.row].ages
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
