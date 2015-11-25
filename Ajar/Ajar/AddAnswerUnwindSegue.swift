//
//  AddAnswerUnwindSegue.swift
//  Ajar
//
//  Created by Catherine Borsting on 11/24/15.
//  Copyright © 2015 Catherine Borsting. All rights reserved.
//

import UIKit

class AddAnswerUnwindSegue: UIStoryboardSegue {

    override func perform() {
        // Assign the source and destination views to local variables.
        var secondVCView = self.sourceViewController.view as UIView!
        var firstVCView = self.destinationViewController.view as UIView!
        
        let screenHeight = UIScreen.mainScreen().bounds.size.height
        
        let window = UIApplication.sharedApplication().keyWindow
        window?.insertSubview(firstVCView, aboveSubview: secondVCView)
        
        // Animate the transition.
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            firstVCView.frame = CGRectOffset(firstVCView.frame, 0.0, screenHeight)
            secondVCView.frame = CGRectOffset(secondVCView.frame, 0.0, screenHeight)
            
            }) { (Finished) -> Void in
                
                self.sourceViewController.dismissViewControllerAnimated(false, completion: nil)
        }
    }
}
