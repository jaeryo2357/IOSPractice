//
//  DatePickerViewController.swift
//  DoIt_Tab
//
//  Created by YangMinUk on 18/08/2019.
//  Copyright © 2019 YangMinUk. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController{

    @IBOutlet weak var selectTime: UILabel!
    @IBOutlet weak var currentTime: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func changePicker(_ sender: UIDatePicker) {
        
        let dateformat :DateFormatter = DateFormatter()
        
        dateformat.dateStyle = .full
        dateformat.timeStyle = .long
        
        currentTime.text = dateformat.string(from: sender.date)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
