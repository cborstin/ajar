//
//  CommentViewController.swift
//  Ajar
//
//  Created by Catherine Borsting on 11/25/15.
//  Copyright © 2015 Catherine Borsting. All rights reserved.
//

import UIKit

class CommentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    var comments:[String] = ["Hahah this is cute", "Omg wow", "This is so funny"]
    var users:[String] = ["Cindy", "Cat", "Karen"]
    var icons: [String] = ["tiger", "dog", "elephant"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var nib = UINib(nibName: "viewTableCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "cell")
        var nib2 = UINib(nibName: "commentTblCell", bundle: nil)
        tableView.registerNib(nib2, forCellReuseIdentifier: "commentCell")
        tableView.rowHeight = 80
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.comments.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:commentTableCell = self.tableView.dequeueReusableCellWithIdentifier("commentCell") as! commentTableCell
        //cell.lblComment.text = comments[indexPath.row]
        cell.imgIcon.image = UIImage(named: icons[indexPath.row])
        //cell.nameLabel.text = users[indexPath.row]
        cell.lblComment.text = comments[indexPath.row]
        cell.lblUserName.text = users[indexPath.row]
        
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
