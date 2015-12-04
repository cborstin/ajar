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
    
    @IBOutlet var imgProfBackground: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btnLocation.tag = 0
        btnAge.tag = 1
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.translucent = true
//        imgProfBackground.backgroundColor = UIColor.whiteColor()
//        imgProfBackground.layer.borderWidth = 2
//        imgProfBackground.layer.borderColor = UIColor.darkGrayColor().CGColor
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let button = sender as? UIButton{
            if let selectOptionViewController = segue.destinationViewController as? SelectOptionViewController{
                selectOptionViewController.index = button.tag
                if(button.tag == 0){
                    selectOptionViewController.data = ["Palo Alto", "Mountain View", "New York", "Chicago", "London", "Sacramento"]
                }
                else{
                    selectOptionViewController.data = ["1 child", "2 children", "3 children", "4 children", "5 children", "6 children", "7 children", "8 children", "9 children", "10+ children"]
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
