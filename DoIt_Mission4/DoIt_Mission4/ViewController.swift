//
//  ViewController.swift
//  DoIt_Mission4
//
//  Created by YangMinUk on 31/07/2019.
//  Copyright © 2019 YangMinUk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var pickerTimeLabel: UILabel!
    
    var selector:Selector = #selector(ViewController.CurrentSystemTime)
    var interval = 1.0 //1초
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: selector, userInfo: nil, repeats: true)
    }

    @IBAction func chageDatePicker(_ sender: UIDatePicker) {
        let formattor = DateFormatter()
        formattor.dateFormat = "yyyy-MM-dd HH:mm aaa"
        pickerTimeLabel.text = formattor.string(from: sender.date)
    }
    
    
    @objc func CurrentSystemTime(){
        let date = NSDate()
        let formattor = DateFormatter()
        formattor.dateFormat = "yyyy-MM-dd HH:mm:ss EE"
        
        currentTimeLabel.text = formattor.string(from: date as Date)
        
        //비교
        formattor.dateFormat = "yyyy-MM-dd HH:mm aaa"
        let currentTime = formattor.string(from: date as Date)
        if(pickerTimeLabel.text ==  currentTime)
        {
            view.backgroundColor = UIColor.red
        }
        else
        {
            view.backgroundColor = UIColor.white
        }
        
        
    }
    
}

