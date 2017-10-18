//
//  ViewController.swift
//  Swift4Camera
//
//  Created by 穂積孝紀 on 2017/10/16.
//  Copyright © 2017年 com.hozumi. All rights reserved.
//

import UIKit
import  Photos
class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ユーザーにカメラの使用許可をだす
        PHPhotoLibrary.requestAuthorization { (status) in
            
            switch(status){
            case .authorized:
                print("authorized")
                
            case .denied:
                print("denied")
                
            case .notDetermined:
                print("notDetermined")
            
            case .restricted:
                print("restricted")
            }
            
            
            
        }
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
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let picker = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            //backImageViewというものをはじめにつくっておいて、そのimageに
            //撮影された画像(アルバムで選択された画像)が、デリゲートメソッドが呼ばれたときに
            //UserPhotoボタンがタップされた時、
            //入っているpickedImageを代入する
            imageView.image = picker
            // アルバムに追加.
            UIImageWriteToSavedPhotosAlbum(picker, self, nil, nil)
        }
        
        //カメラ画面(アルバム画面)を閉じる処理
        picker.dismiss(animated: true, completion: nil)
    }
    
    //撮影がキャンセルされた際に呼ばれるdelegateメソッド
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

