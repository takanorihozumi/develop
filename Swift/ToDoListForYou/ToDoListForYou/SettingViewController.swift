//
//  SettingViewController.swift
//  ToDoListForYou
//
//  Created by 穂積孝紀 on 2017/10/16.
//  Copyright © 2017年 com.hozumi. All rights reserved.
//

import UIKit
import Photos

class SettingViewController: UIViewController ,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var sv: UIScrollView!
    @IBOutlet var backImageView: UIImageView!
    var isAlbumImage = false
    
    var vc:UIView = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vc.frame = CGRect(x: 0, y: 0, width: 800, height: 80)
        
        setScrollView()
        checkAllowCamera()

    }
    
    func setScrollView(){
        for i in 0..<10{
            let button:UIButton = UIButton()
            button.tag = i
            button.frame = CGRect(x: (i*80), y: 0, width: 80, height: 80)
            
            let buttonImage:UIImage = UIImage(named: String(i) + ".jpg")!
            button.setImage(buttonImage, for: .normal)
            button.addTarget(self/*自身のメソッド*/, action: #selector(selectImage), for: .touchUpInside/*押して離した時に発動*/)
            vc.addSubview(button)
        }
        //scrollViewにつける
        sv.addSubview(vc)
        sv.contentSize = vc.bounds.size
    }
    
    //ユーザーにカメラの使用許可をだす
    func checkAllowCamera(){
        
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
    
    func selectImage(sender:UIButton) {
        //画像をUIImageViewに反映する
        backImageView.image = UIImage(named: String(sender.tag) + ".jpg")
        
        //buttonのtag情報をアプリ内に保存
        UserDefaults.standard.set(String(sender.tag), forKey: "image")
        isAlbumImage = false
        if let controller = self.presentingViewController as? ViewController {
            controller.isAlbumImage = false
        }
        
    }

    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func getImageFromAlbum(_ sender: Any) {
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
    
    //imagepickerのdelegateMethod
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let picker = info[UIImagePickerControllerOriginalImage] as? UIImage {
            saveImage(image: picker)
            
            let imageDate:NSData = UserDefaults.standard.object(forKey: "imageData") as! NSData
            backImageView.image = UIImage(data:imageDate as Data)
            isAlbumImage = true
            if let controller = self.presentingViewController as? ViewController {
                controller.isAlbumImage = true
                print("aaa")
            }
        }
        
        //アルバム画面を閉じる処理
        picker.dismiss(animated: true, completion: nil)
    }
    
    func saveImage (image: UIImage){
        UserDefaults.standard.set(UIImageJPEGRepresentation(image, 0.8), forKey: "imageData")
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
