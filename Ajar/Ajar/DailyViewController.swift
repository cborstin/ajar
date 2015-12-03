//
//  DailyViewController.swift
//  Ajar
//
//  Created by Catherine Borsting on 11/18/15.
//  Copyright (c) 2015 Catherine Borsting. All rights reserved.
//

import UIKit

class DailyViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet var questionScrollView: UIScrollView!
    @IBOutlet var pageControl: UIPageControl!
    var jarImages: [UIImage] = []
    var pageViews: [UIImageView?] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        jarImages = [UIImage(named: "JarWhiteDay1.png")!,
            UIImage(named: "JarWhiteDay2.png")!]
        
        let pageCount = jarImages.count
        
        pageControl.currentPage = 0
        pageControl.numberOfPages = pageCount
        
        for _ in 0..<pageCount {
            pageViews.append(nil)
        }
        
        let pagesScrollViewSize = questionScrollView.frame.size
        questionScrollView.contentSize = CGSize(width: pagesScrollViewSize.width * CGFloat(jarImages.count),
            height: pagesScrollViewSize.height)
        loadVisiblePages()
        //setupGestureRecognizer()
        
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.translucent = true
        
        
        

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = false
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setupGestureRecognizer() {
        let doubleTap = UITapGestureRecognizer(target: self, action: "handleDoubleTap:")
        doubleTap.numberOfTapsRequired = 1
        questionScrollView.addGestureRecognizer(doubleTap)
    }
    
    func handleDoubleTap(recognizer: UITapGestureRecognizer){
        if let image = recognizer.view as? UIImageView{
            performSegueWithIdentifier("DailySegue", sender: image.tag)
        }
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "DailySegue" {
            if let answerViewController = segue.destinationViewController as? AnswerViewController {
                answerViewController.index = sender as? Int
            }
        }
    }

    
    func loadPage(page: Int) {
        if page < 0 || page >= jarImages.count {
            // If it's outside the range of what you have to display, then do nothing
            return
        }
        
        // 1
        if let _ = pageViews[page] {
            // he view is already loaded.
            
        } else {
            // 2
            var frame = questionScrollView.bounds
            frame.origin.x = frame.size.width * CGFloat(page)
            frame.origin.y = 0.0
            
            // 3
            let newPageView = UIImageView(image: jarImages[page])
            let doubleTap = UITapGestureRecognizer(target: self, action: "handleDoubleTap:")
            doubleTap.numberOfTapsRequired = 1
            newPageView.userInteractionEnabled = true
            newPageView.tag = page
            newPageView.addGestureRecognizer(doubleTap)
            newPageView.contentMode = .ScaleAspectFit
            newPageView.frame = frame
            
            questionScrollView.addSubview(newPageView)
            
            // 4
            pageViews[page] = newPageView
            
        }
    }
    
    
    func purgePage(page: Int) {
        if page < 0 || page >= jarImages.count {
            // If it's outside the range of what you have to display, then do nothing
            return
        }
        
        // Remove a page from the scroll view and reset the container array
        if let pageView = pageViews[page] {
            pageView.removeFromSuperview()
            pageViews[page] = nil
        }
    }
    
    
    func loadVisiblePages() {
        // First, determine which page is currently visible
        let pageWidth = questionScrollView.frame.size.width
        let page = Int(floor((questionScrollView.contentOffset.x * 2.0 + pageWidth) / (pageWidth * 2.0)))
        
        // Update the page control
        pageControl.currentPage = page
        
        // Work out which pages you want to load
        let firstPage = page - 1
        let lastPage = page + 1
        
        // Purge anything before the first page
        for var index = 0; index < firstPage; ++index {
            purgePage(index)
        }
        
        // Load pages in our range
        for index in firstPage...lastPage {
            loadPage(index)
        }
        
        // Purge anything after the last page
        for var index = lastPage+1; index < jarImages.count; ++index {
            purgePage(index)
        }
    }

    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // Load the pages that are now on screen
        loadVisiblePages()
    }
    
   
    
    func tapDetected() {
        print("Single Tap on imageview")
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
