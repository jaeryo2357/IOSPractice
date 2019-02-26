//
//  ViewController.swift
//  ViewTranslate
//
//  Created by YangMinUk on 25/02/2019.
//  Copyright © 2019 YangMinUk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet var nameinput:UITextField?
    @IBOutlet var ageinput:UITextField?

    @IBAction func setinput(_ sender:UIButton)
    {
        UserInterface.shared.name = nameinput?.text
        UserInterface.shared.age = ageinput?.text
    }
    
}

