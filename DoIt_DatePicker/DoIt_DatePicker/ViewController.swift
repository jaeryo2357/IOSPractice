//
//  ViewController.swift
//  DoIt_DatePicker
//
//  Created by YangMinUk on 30/07/2019.
//  Copyright © 2019 YangMinUk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var count = 0
    
    @IBOutlet weak var lblCurrentTime: UILabel!
    
    @IBOutlet weak var lblPickerTime: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector:timeSelector
        ,userInfo: nil,repeats: true)
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        
        let datePickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm: EEE" //eee 요일
        lblPickerTime.text = "선택 시간: " + formatter.string(from: datePickerView.date)
    }
    
    @objc func updateTime(){
//        lblCurrentTime.text = String(count)
//        count = count + 1
        
        let date = NSDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblCurrentTime.text = "현재시간 : " + formatter.string(from: date as Date)
    }
    
}

