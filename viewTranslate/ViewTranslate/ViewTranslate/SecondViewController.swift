//
//  SecondViewController.swift
//  ViewTranslate
//
//  Created by YangMinUk on 25/02/2019.
//  Copyright © 2019 YangMinUk. All rights reserved.
//

import UIKit

class SecondViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func popprev(){
        self.navigationController?.popViewController(animated: true)
        //navigation 스택에 있는 view를 pop함으로서 뒤로 이동
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func dissmissModal(){
        self.dismiss(animated: true, completion: nil)
        //modal로 창을 띄운것을 끔
    }

}
