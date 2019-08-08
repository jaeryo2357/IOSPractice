//
//  ViewController.swift
//  DoIt_Mission5
//
//  Created by YangMinUk on 08/08/2019.
//  Copyright © 2019 YangMinUk. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate , UIPickerViewDataSource{
  
    
    let MAX_ARRAY_NUM = 10
    var imageArray = [UIImage?]()
    let PICKER_VIEW_COLUMN = 2
    
    var imageFileName = ["1.jpg" , "2.jpg","3.jpg","4.jpg","5.jpg"
    ,"6.jpg" , "7.jpg","8.jpg","9.jpg","10.jpg"]

    @IBOutlet weak var selectItem: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pickerView: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0 ..< MAX_ARRAY_NUM{
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        
        selectItem.text = imageFileName[0]
        imageView.image = imageArray[0]
        
        pickerView.delegate = self
        // Do any additional setup after loading the view.
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }
   
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let image = UIImageView(image: imageArray[row])
        image.frame = CGRect(x: 0, y: 0, width: 100, height: 150)
        return image
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //component가 colum
        
        if(component == 0 )
        {
            selectItem.text = imageFileName[row]
        }else{
            imageView.image = imageArray[row]
        }
    }
    
}

