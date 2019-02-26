//
//  ViewController.swift
//  ImagePicker
//
//  Created by YangMinUk on 25/02/2019.
//  Copyright © 2019 YangMinUk. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate{

    //ios에서는 delegate는 일종의 콜백 메소드로 함수를 오버라이드 하여 코드를 구현
    lazy var imagepicker:UIImagePickerController = {
        let picker:UIImagePickerController=UIImagePickerController()
        picker.delegate=self //view의 delegate를 상속받았기 때문에 self로 대입
        picker.sourceType = .photoLibrary
        return picker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var imageview:UIImageView! //view와 연결
    
    @IBAction func present(){
        self.present(self.imagepicker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //모달 창을 내렸을 때
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //이미지를 선택했을 때,그 값을 info로 가져옴 key로 value 반환
        if let originalimage:UIImage=info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            self.imageview.image=originalimage
        }
        
        self.dismiss(animated: true, completion: nil)
    }

}

