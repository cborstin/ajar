//
//  SelectOptionViewController.swift
//  Ajar
//
//  Created by Catherine Borsting on 12/1/15.
//  Copyright © 2015 Catherine Borsting. All rights reserved.
//

import UIKit

class SelectOptionViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{

    @IBOutlet var pickerView: UIPickerView!
    var data: [String] = ["Hi", "Yo"]
    var selected: String = ""
    var index:Int=0
    
    @IBOutlet weak var lblSelected: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("Segue Performed")
        if let userViewController = segue.destinationViewController as? UserViewController{
            print(selected)
            if(index == 0){
                userViewController.lblLocation.text = selected
            }
            else{
                userViewController.lblAge.text = selected
            }
            
        }
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       selected = data[row]
        lblSelected.text = data[row]
        print(self.parentViewController)
        if let parentView = self.parentViewController {
            if let parentView = parentView as? UINavigationController {
                if let parent = parentView.viewControllers[0] as? UserViewController{
                    if(index==0){
                        parent.lblLocation.text = data[row]
                    }
                    else{
                        parent.lblAge.text = data[row]
                    }
                    

                }
            }
        }
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
