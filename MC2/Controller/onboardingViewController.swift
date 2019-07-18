//
//  onboardingViewController.swift
//  MC2
//
//  Created by Michael Varian Sutanto on 17/07/19.
//  Copyright © 2019 Group 16. All rights reserved.
//

import UIKit

class onboardingViewController: UIViewController, UIScrollViewDelegate, OnBoardingInputData {
    func didTap() {
        performSegue(withIdentifier: "goToHome", sender: self)
//        let alert = UIAlertController(title: "What's your name?", message: nil, preferredStyle: .alert)
//                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//
//                alert.addTextField(configurationHandler: { textField in
//                    textField.placeholder = "Masukan nama anak anda ..."
//                })
//
//                alert.addTextField(configurationHandler: { textField in
//                    textField.placeholder = "Masukan tanggal lahir anak anda ..."
//                })
//
//                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
//
//                    if let name = alert.textFields?.first?.text {
//                        print("Your name: \(name)")
//                    }
//                }))
//
//                self.present(alert, animated: true)
    }
    

    //create scroll view outlet
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet{
        scrollView.delegate = self
        }
    }
    
    //create page control outlet
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var pushButton: UIButton!
    
    
    //create new variable called slides
    var slides : [Slide] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slides = createSlides()
        setupSlideScrollView(slides: slides)
        
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        view.bringSubviewToFront(pageControl)

    }
    
    func createSlides() -> [Slide] {
        
        let slide1:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide1.imageView.image = UIImage(named: "onboarding_1")
        slide1.mainTitle.text = "Main Title 1"
        slide1.descLabel.text = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod."
        slide1.listener = self
        
        let slide2:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide2.imageView.image = UIImage(named: "onboarding_2")
        slide2.mainTitle.text = "Main Title 2"
        slide2.descLabel.text = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod."
        slide2.listener = self
        
        let slide3:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide3.imageView.image = UIImage(named: "onboarding_3")
        slide3.mainTitle.text = "Main Title 3"
        slide3.descLabel.text = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod."
        slide3.listener = self
        
        let slide4:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide4.imageView.image = UIImage(named: "onboarding_4")
        slide4.mainTitle.text = "Main Title 4"
        slide4.descLabel.text = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod."
        slide4.listener = self
        
        return [slide1, slide2, slide3, slide4]
        
    }
    
    func setupSlideScrollView(slides : [Slide]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
    
    /*
     * default function called when view is scolled. In order to enable callback
     * when scrollview is scrolled, the below code needs to be called:
     * slideScrollView.delegate = self or
     */
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
        
        let maximumHorizontalOffset: CGFloat = scrollView.contentSize.width - scrollView.frame.width
        let currentHorizontalOffset: CGFloat = scrollView.contentOffset.x
        
        // vertical
        let maximumVerticalOffset: CGFloat = scrollView.contentSize.height - scrollView.frame.height
        let currentVerticalOffset: CGFloat = scrollView.contentOffset.y
        
        let percentageHorizontalOffset: CGFloat = currentHorizontalOffset / maximumHorizontalOffset
        let percentageVerticalOffset: CGFloat = currentVerticalOffset / maximumVerticalOffset
        
        
        /*
         * below code changes the background color of view on paging the scrollview
         */
        //        self.scrollView(scrollView, didScrollToPercentageOffset: percentageHorizontalOffset)
        
        
        /*
         * below code scales the imageview on paging the scrollview
         */
        let percentOffset: CGPoint = CGPoint(x: percentageHorizontalOffset, y: percentageVerticalOffset)
        
        if(percentOffset.x > 0 && percentOffset.x <= 0.25) {
            
            slides[0].imageView.transform = CGAffineTransform(scaleX: (0.25-percentOffset.x)/0.25, y: (0.25-percentOffset.x)/0.25)
            slides[1].imageView.transform = CGAffineTransform(scaleX: percentOffset.x/0.25, y: percentOffset.x/0.25)
            
        } else if(percentOffset.x > 0.25 && percentOffset.x <= 0.50) {
            slides[1].imageView.transform = CGAffineTransform(scaleX: (0.50-percentOffset.x)/0.25, y: (0.50-percentOffset.x)/0.25)
            slides[2].imageView.transform = CGAffineTransform(scaleX: percentOffset.x/0.50, y: percentOffset.x/0.50)
            
        } else if(percentOffset.x > 0.50 && percentOffset.x <= 0.75) {
            slides[2].imageView.transform = CGAffineTransform(scaleX: (0.75-percentOffset.x)/0.25, y: (0.75-percentOffset.x)/0.25)
            slides[3].imageView.transform = CGAffineTransform(scaleX: percentOffset.x, y: percentOffset.x)
            
        }
    }
}

// untuk menghubungkan button di slide UIView (Custom)

    protocol OnBoardingInputData {
        func didTap()
    }


