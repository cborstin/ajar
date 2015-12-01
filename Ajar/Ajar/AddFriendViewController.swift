//
//  ViewController.swift
//  Ajar
//
//  Created by Catherine Borsting on 11/13/15.
//  Copyright (c) 2015 Catherine Borsting. All rights reserved.
//

import UIKit

class AddFriendViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var btnBack: UIButton!
    let friends = [
        Friend(img: "elephant", name: "Rachel", locate: "Chicago", age: "4-5"),
        Friend(img: "tiger", name: "Nathan", locate: "London", age: "4-5"),
        Friend(img: "dog", name: "Griffin", locate: "Sacramento", age: "1-2")
    ]
    var addedFriends: [Friend] = []
    override func viewDidLoad() {
        btnBack.addTarget(self, action: "pressedBack:", forControlEvents: .TouchUpInside)
        let nib = UINib(nibName: "AddFriendTblCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "addFriendCell")
        tableView.rowHeight = 100
        let footerView =  UIView(frame: CGRectZero)
        tableView.tableFooterView = footerView
        tableView.tableFooterView!.hidden = true
        tableView.backgroundColor = UIColor.clearColor()
        tableView.layer.borderWidth = 2.0;
        tableView.layer.borderColor = UIColor.lightGrayColor().CGColor
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
    }
    
    
    func pressedBack(sender: UIButton!){
        performSegueWithIdentifier("idAddFriendUnwindSegue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "idAddFriendUnwindSegue" {
            if let friendViewController = segue.destinationViewController as? FriendsViewController {
                friendViewController.friends += addedFriends
                
            }
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("Yo")
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:AddFriendTableCell = self.tableView.dequeueReusableCellWithIdentifier("addFriendCell") as! AddFriendTableCell
        cell.imgIcon.image = UIImage(named: friends[indexPath.row].icon)
        cell.lblUsername.text = friends[indexPath.row].username
        cell.btnAdd.tag = indexPath.row
        cell.btnAdd.addTarget(self, action: "pressedAdd:", forControlEvents: .TouchUpInside)
        cell.separatorInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        
        return cell
    }
    func pressedAdd(sender: UIButton!){
        addedFriends.append(friends[sender.tag])
        sender.removeTarget(self, action: "pressedAdd:", forControlEvents: .TouchUpInside)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        //Added comment
    }
    
    
    
    
    
}

