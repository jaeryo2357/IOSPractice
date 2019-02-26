//
//  ViewController.swift
//  Gesture
//
//  Created by YangMinUk on 26/02/2019.
//  Copyright © 2019 YangMinUk. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UIGestureRecognizerDelegate{

    
    @IBOutlet var textinput:UITextField!
    
//    @IBAction func showkeyboard(_ sender:UITextField){
//     //   self.view.resignFirstResponder() 키보드 숨기기였음
//        textinput.becomeFirstResponder()//키보드 보이게
    // 애뮬레이터 하드웨어 속성에서 키보드를 허용해줘야 보임
//    }
    
    //1. 인터페이스에서 등록  제스터는 변수를 안만들고 함수로 등록함
    @IBAction func tabing(_ sender:UIGestureRecognizer){
      self.view.endEditing(true) //키보드 내리기
    }
    //target action 간단한 콜백함수
    //delegate 세밀하게 콜백함수를 정의할때
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //2. 코드로 target 넣어주기
//        let tabgesture:UITapGestureRecognizer=UITapGestureRecognizer(target: self, action: #selector(self.tabing(_:)))
//        self.view.addGestureRecognizer(tabgesture)
        
        //3. delegate로 넣어주기
        let tapgesture:UITapGestureRecognizer=UITapGestureRecognizer()
        tapgesture.delegate=self
        self.view.addGestureRecognizer(tapgesture)
        // Do any additional setup after loading the view, typically from a nib.
    }

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        //tab이 시전되고 이것을 받아들여도 되는지 묻는 함수
        self.view.endEditing(true)
        return true;//여기서는 true false 관계없음
    }

}

