//
//  ViewController.swift
//  DoIt_PageControl
//
//  Created by YangMinUk on 17/08/2019.
//  Copyright © 2019 YangMinUk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageVIew: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var images = ["lamp-off.png","lamp-on.png","lamp-remove.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        pageControl.numberOfPages = images.count
        
        pageControl.currentPage = 0
        
        pageControl.pageIndicatorTintColor = UIColor.green
        
        pageControl.currentPageIndicatorTintColor = UIColor.red
        
        imageVIew.image = UIImage(named: images[0])
    }


    @IBAction func pageChange(_ sender: UIPageControl) {
        imageVIew.image = UIImage(named: images[pageControl.currentPage])
        
    }
}

