//
//  ViewController.swift
//  Doit_Mission3
//
//  Created by YangMinUk on 31/07/2019.
//  Copyright © 2019 YangMinUk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var imageName = ["01.png","02.png","03.png","04.png","05.png","06.png"]
    
    var currentImage = 0
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image = UIImage(named: imageName[currentImage])
    }

    @IBAction func BeforeImage(_ sender: UIButton) {
        if(currentImage != 0)
        {
            currentImage = currentImage - 1
            imageView.image = UIImage(named: imageName[currentImage])
        }
    }
    
    @IBAction func AfterImage(_ sender: UIButton) {
        if(currentImage != imageName.count - 1)
        {
            currentImage = currentImage + 1
            imageView.image = UIImage(named: imageName[currentImage])
        }
    }
}

