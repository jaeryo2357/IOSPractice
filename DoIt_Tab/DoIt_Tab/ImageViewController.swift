//
//  ImageViewController.swift
//  DoIt_Tab
//
//  Created by YangMinUk on 18/08/2019.
//  Copyright © 2019 YangMinUk. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!

    var imageSize = true

    @IBOutlet weak var imageSwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = UIImage(named: "lamp-on.png")
        // Do any additional setup after loading the view.
        imageSwitch.isOn = true
    }
    
   
    @IBAction func changeSize(_ sender: UIButton) {
        let width = imageView.frame.width
        let height = imageView.frame.height
        
        if(imageSize) //이미지 줄이기
        {
            let rect:CGRect = CGRect(x: 0, y: 0, width: width/2, height: height/2)
       
            imageView.frame = rect
            imageSize = false
            sender.setTitle("확대", for: .normal)
            
        }else{ // 이미지 늘리기
            let rect:CGRect = CGRect(x: 0, y: 0, width: width*2, height: height*2)
            
            imageView.frame = rect
            imageSize = true
            sender.setTitle("축소", for: .normal)
        }
       
    }
    
    @IBAction func changeLight(_ sender: UISwitch) {
        if(sender.isOn)
        {
            imageView.image = UIImage(named: "lamp-on.png")
        }else
        {
            imageView.image = UIImage(named: "lamp-off.png")
        }
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
