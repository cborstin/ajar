//
//  UserViewController.swift
//  Ajar
//
//  Created by Catherine Borsting on 12/1/15.
//  Copyright © 2015 Catherine Borsting. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    @IBOutlet var lblLocation: UILabel!
    
    @IBOutlet var lblAge: UILabel!

    @IBOutlet weak var btnLocation: UIButton!
    @IBOutlet weak var btnAge: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btnLocation.tag = 0
        btnAge.tag = 1
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let button = sender as? UIButton{
            if let selectOptionViewController = segue.destinationViewController as? SelectOptionViewController{
                selectOptionViewController.index = button.tag
                if(button.tag == 0){
                    selectOptionViewController.data = ["Palo Alto", "Mountain View", "New York", "London"]
                }
                else{
                    selectOptionViewController.data = ["1-2", "1-3", "1-4", "1-5"]
                }
                
            
            }
        }
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
