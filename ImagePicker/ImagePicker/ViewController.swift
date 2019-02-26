//
//  ViewController.swift
//  ImagePicker
//
//  Created by YangMinUk on 25/02/2019.
//  Copyright © 2019 YangMinUk. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate{

    lazy var imagepicker:UIImagePickerController = {
        let picker:UIImagePickerController=UIImagePickerController()
        picker.delegate=self
        picker.sourceType = .photoLibrary
        return picker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var imageview:UIImageView!
    
    @IBAction func present(){
        self.present(self.imagepicker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //모달 창을 내렸을 때
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let originalimage:UIImage=info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            self.imageview.image=originalimage
        }
        
        self.dismiss(animated: true, completion: nil)
    }

}

