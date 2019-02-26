//
//  ViewController.swift
//  DatePicker
//
//  Created by YangMinUk on 26/02/2019.
//  Copyright © 2019 YangMinUk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var datePicker:UIDatePicker!
    @IBOutlet weak var dateLabel:UILabel!
    
    let dateFormat:DateFormatter = {
        let format:DateFormatter = DateFormatter()
        //format.dateStyle = .medium
        //format.timeStyle = .medium // at 시간
        
        format.dateFormat="yyyy/MM/dd hh/mm/ss" //사용자가 직접 정의해주고 싶을 때
        return format
    }()
    
    @IBAction func didDatePickerChange(_ sender: UIDatePicker){
        let date:Date=sender.date
        let dateString:String = dateFormat.string(from: date)
        
        dateLabel.text=dateString
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.addTarget(self, action: #selector(self.didDatePickerChange(_:)), for: UIControl.Event.valueChanged)
        // IBAction을 사용하지 않고 코드로 연결할 때 사용 Targer-event
        // Do any additional setup after loading the view, typically from a nib.
    }


}

