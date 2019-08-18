//
//  ViewController.swift
//  DoIt_Tab
//
//  Created by YangMinUk on 18/08/2019.
//  Copyright © 2019 YangMinUk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnMoveImageView(_ sender: Any) {
        tabBarController?.selectedIndex = 1
    }
    
    @IBAction func btnMoveDatePickerView(_ sender: Any) {
        tabBarController?.selectedIndex = 2
    }
}

