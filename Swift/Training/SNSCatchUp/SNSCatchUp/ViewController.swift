//
//  ViewController.swift
//  SNSCatchUp
//
//  Created by 穂積孝紀 on 2017/10/22.
//  Copyright © 2017年 com.hozumi. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func camera(_ sender: Any) {
        let sourceType:UIImagePickerControllerSourceType = UIImagePickerControllerSourceType.camera
        
        // カメラが利用可能かチェック
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera){
            // インスタンスの作成
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self

            self.present(cameraPicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func album(_ sender: Any) {
        let sourceType:UIImagePickerControllerSourceType = UIImagePickerControllerSourceType.photoLibrary
        
        // アルバムが利用可能かチェック
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary){
            // インスタンスの作成
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            
            self.present(cameraPicker, animated: true, completion: nil)
        }
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

