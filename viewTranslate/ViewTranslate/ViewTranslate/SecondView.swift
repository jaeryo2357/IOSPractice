//
//  SecondView.swift
//  ViewTranslate
//
//  Created by YangMinUk on 25/02/2019.
//  Copyright © 2019 YangMinUk. All rights reserved.
//

import UIKit

class SecondView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func popstackView(){
        self.navigationController?.popViewController(animated: true)
    }
}
