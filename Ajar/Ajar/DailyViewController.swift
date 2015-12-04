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
    var responseOne = [
     Data(fname: "NoteWhite", resp: "I am thankful that Sara took her first unassisted step today. :)", name: "Cat", comment: [("Cindy", "dog", "She'll be running around the house and knocking over things before you know it!"), ("Karen", "elephant", "Ahh, what a big milestone. Did you get a video?"), ("Cat", "tiger", "Yes! I'll show you next time we get brunch.")], img: "tiger"),
        Data(fname: "NoteWhite", resp: "I am grateful for the sun and access to coffee and Brian's first word!", name: "Cindy", comment: [("Cat", "tiger", "First words are usually at the end of 6 months, right? Wow, time passes fast."), ("Amy", "cattle", "Shall I drive over just to listen to Brian, I think yes.")], img: "dog"),
        Data(fname: "NoteWhite", resp: "Charlotte made her first friend at preschool!", name: "Karen", comment: [("Cindy", "dog", "Yay for friendship! Btw, we should do playdates soon."), ("Cat", "tiger", "Hey I want in, too!"), ("Cindy", "dog", "Of course, that's a given. ;)")], img: "elephant")
    ]
    var responseTwo = [
        Data(fname: "NoteWhite", resp: "Sara tasted dark chocolate for the first time today. I didn't know her face could pucker up that much.", name: "Cat", comment: [("Cindy", "dog", "HAHAHAH, I'm pretty sure dark chocolate is an acquired taste."), ("Karen", "elephant", "Even I don't like dark chocolate and I'm an adult, please.")], img: "tiger"),
        Data(fname: "NoteWhite", resp: "Brian ran up and down the beach today. So young, so spry.", name: "Cindy", comment: [("Cat", "tiger", "We should really go jogging."), ("Cindy", "dog", "What about the children?"), ("Karen", "elephant", "I mean clearly Brian can run with us, am I right. :)")], img: "dog"),
        Data(fname: "NoteWhite", resp: "Charlotte chased birds at the park and cried because she laughed so hard. :)", name: "Karen", comment: [("Cat", "tiger", "Aww, I love moments like these."), ("Cindy", "dog", "Didn't you used to write poetry in college? You should write one about this."), ("Karen", "elephant", "Shh, Cindy. Shh..")], img: "elephant")
    ]

    
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
                answerViewController.responseOne = self.responseOne
                answerViewController.responseTwo = self.responseTwo
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
