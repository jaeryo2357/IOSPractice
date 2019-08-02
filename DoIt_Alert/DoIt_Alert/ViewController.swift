//
//  ViewController.swift
//  DoIt_Alert
//
//  Created by YangMinUk on 02/08/2019.
//  Copyright © 2019 YangMinUk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let imgOn = UIImage(named: "lamp-on.png")
      let imgOff = UIImage(named: "lamp-off.png")
      let imgRemove = UIImage(named: "lamp-remove.png")
    
    var isLampOn = true
    
    @IBOutlet weak var lampimg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lampimg.image = imgOn
    }

    @IBAction func btnLampON(_ sender: UIButton) {
        
        if(isLampOn == true)
        {
            let lampOnAlert = UIAlertController(title: "경고", message: "현재 On 상태입니다", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title:"네, 알겠습니다",style: UIAlertAction.Style.default,handler: nil)
            lampOnAlert.addAction(onAction)
            present(lampOnAlert, animated: true, completion: nil)
        }else{
            lampimg.image = imgOn
            isLampOn = true
        }
    }
    
    @IBAction func btnLampOff(_ sender: UIButton) {
        
        if isLampOn {
            let lampOnAlert = UIAlertController(title: "램프 끄기", message: "램프를 끄시겠습니까?", preferredStyle: UIAlertController.Style.alert)
            let offAction = UIAlertAction(title:"네",style: UIAlertAction.Style.default,handler: {
                ACTION in self.lampimg.image = self.imgOff
                self.isLampOn = false
            })
            let cancelAction = UIAlertAction(title:"아니오",style: UIAlertAction.Style.default,handler: nil)
            lampOnAlert.addAction(offAction)
            lampOnAlert.addAction(cancelAction)
            present(lampOnAlert, animated: true, completion: nil)
        }
    }
    @IBAction func btnLampRemove(_ sender: UIButton) {
        
        let lampOnAlert = UIAlertController(title: "램프 제거", message: "램프를 제거하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        let offAction = UIAlertAction(title:"아니오, 끕니다(off)",style: UIAlertAction.Style.default,handler: {
            ACTION in self.lampimg.image = self.imgOff
            self.isLampOn = false
        })
        
        let onAction = UIAlertAction(title:"아니오, 켭니다(on)",style: UIAlertAction.Style.default,handler: {
            ACTION in self.lampimg.image = self.imgOn
            self.isLampOn = true
        })
        let removeAction = UIAlertAction(title:"네, 제거합니다",style: UIAlertAction.Style.default,handler: {
            ACTION in self.lampimg.image = self.imgRemove
            self.isLampOn = false
        })
        lampOnAlert.addAction(offAction)
        lampOnAlert.addAction(onAction)
        lampOnAlert.addAction(removeAction)
        present(lampOnAlert, animated: true, completion: nil)
    }
}

