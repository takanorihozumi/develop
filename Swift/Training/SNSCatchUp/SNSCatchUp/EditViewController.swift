//
//  EditViewController.swift
//  SNSCatchUp
//
//  Created by 穂積孝紀 on 2017/10/22.
//  Copyright © 2017年 com.hozumi. All rights reserved.
//

import UIKit
import CoreImage

class EditViewController: UIViewController {
    
    //これを使うとフィルターの速度が速くなる
    var ciContext = CIContext()

    @IBOutlet var editImageView: UIImageView!
    var willEditImage :UIImage = UIImage()
    
    @IBOutlet var sc: UIScrollView!
    
    //scrollView用
    var uv = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        editImageView.image = nil
        editImageView.image = willEditImage
        
        //位置とサイズを決める
        uv.frame = CGRect(x: 0, y: 418, width: self.view.frame.size.width*2, height: 128)
        
        //UIButtonを作成
        for i in 0..<6{
            let button:UIButton = UIButton()
            //x軸はi*80都することでボタンを一定間隔ごとに配置していく
            button.frame = CGRect(x: i*80, y: 0, width: 80, height: 80)
            button.tag = i
            //どこのメソッドを呼ぶか定義しておく
            button.addTarget(self, action: #selector(tap/*これを呼ぶ*/), for: .touchUpInside/*タッチアップ時にメソッド発動*/)
            let buttonImage:UIImage = UIImage(named: String(i) + ".jpg")!
            button.setImage(buttonImage, for: UIControlState.normal)
            uv.addSubview(button)
        }
        //scrollViewにUIViewを貼り付ける
        sc.addSubview(uv)
        ///scrollVieのサイズをUIViewのサイズに合わせておく（２倍のサイズにしているためスクロールする）
        sc.contentSize = uv.bounds.size
    }
    
    @objc func tap(sender:UIButton){
        //tagの番号によってimageにフィルターを付けたい
        if sender.tag == 0{
         filter1()
        }else if sender.tag == 1{
            filter2()
        }else if sender.tag == 2{
            filter3()
        }else if sender.tag == 3{
            filter4()
        }else if sender.tag == 4{
            filter5()
        }else if sender.tag == 5{
            filter6()
        }
    }
    
    //画面遷移（画像を渡して）
    @IBAction func next(_ sender: Any) {
        performSegue(withIdentifier: "end", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "end"){
            let snsVC:SNSViewController = segue.destination as! SNSViewController
            snsVC.endImage = editImageView.image!
        }
    }
    
    
    func filter1(){
        
        // image が 元画像のUIImage
        let ciImage:CIImage = CIImage(image:editImageView.image!)!;
        let ciFilter:CIFilter = CIFilter(name: "CISepiaTone")!
        ciFilter.setValue(ciImage, forKey: kCIInputImageKey)
        ciFilter.setValue(0.8, forKey: "inputIntensity")
        self.ciContext = CIContext(options: nil)
        let cgimg:CGImage = ciContext.createCGImage(ciFilter.outputImage!, from:ciFilter.outputImage!.extent)!
        
        //image2に加工後のUIImage
        let image2:UIImage = UIImage(cgImage: cgimg, scale: 1.0, orientation:UIImageOrientation.up)
        
        editImageView.image = image2
        
        
    }
    
    func filter2(){
        let ciImage:CIImage = CIImage(image:editImageView.image!)!;
        let ciFilter:CIFilter = CIFilter(name: "CIColorMonochrome")!
        ciFilter.setValue(ciImage, forKey: kCIInputImageKey)
        ciFilter.setValue(CIColor(red: 0.75, green: 0.75, blue: 0.75), forKey: "inputColor")
        ciFilter.setValue(1.0, forKey: "inputIntensity")
        self.ciContext = CIContext(options: nil)
        let cgimg:CGImage = ciContext.createCGImage(ciFilter.outputImage!, from:ciFilter.outputImage!.extent)!
        //image2に加工後のUIImage
        let image2:UIImage = UIImage(cgImage: cgimg, scale: 1.0, orientation:UIImageOrientation.up)
        editImageView.image = image2
        
    }
    
    
    func filter3(){
        let ciImage:CIImage = CIImage(image:editImageView.image!)!;
        let ciFilter:CIFilter = CIFilter(name: "CIFalseColor" )!
        ciFilter.setValue(ciImage, forKey: kCIInputImageKey)
        ciFilter.setValue(CIColor(red: 0.44, green: 0.5, blue: 0.2), forKey: "inputColor0")
        ciFilter.setValue(CIColor(red: 1, green: 0.92, blue: 0.50), forKey: "inputColor1")
        self.ciContext = CIContext(options: nil)
        let cgimg:CGImage = ciContext.createCGImage(ciFilter.outputImage!, from:ciFilter.outputImage!.extent)!
        //image2に加工後のUIImage
        let image2:UIImage = UIImage(cgImage: cgimg, scale: 1.0, orientation:UIImageOrientation.up)
        editImageView.image = image2
        
        
        
    }
    
    
    func filter4(){
        
        let ciImage:CIImage = CIImage(image:editImageView.image!)!;
        let ciFilter:CIFilter = CIFilter(name: "CIColorControls" )!
        ciFilter.setValue(ciImage, forKey: kCIInputImageKey)
        ciFilter.setValue(1.0, forKey: "inputSaturation")
        ciFilter.setValue(0.5, forKey: "inputBrightness")
        ciFilter.setValue(3.0, forKey: "inputContrast")
        self.ciContext = CIContext(options: nil)
        let cgimg:CGImage = ciContext.createCGImage(ciFilter.outputImage!, from:ciFilter.outputImage!.extent)!
        //image2に加工後のUIImage
        let image2:UIImage = UIImage(cgImage: cgimg, scale: 1.0, orientation:UIImageOrientation.up)
        editImageView.image = image2
        
    }
    
    
    func filter5(){
        
        let ciImage:CIImage = CIImage(image:editImageView.image!)!;
        let ciFilter:CIFilter = CIFilter(name: "CIToneCurve" )!
        ciFilter.setValue(ciImage, forKey: kCIInputImageKey)
        ciFilter.setValue(CIVector(x: 0.0, y: 0.0), forKey: "inputPoint0")
        ciFilter.setValue(CIVector(x: 0.25, y: 0.1), forKey: "inputPoint1")
        ciFilter.setValue(CIVector(x: 0.5, y: 0.5), forKey: "inputPoint2")
        ciFilter.setValue(CIVector(x: 0.75, y: 0.9), forKey: "inputPoint3")
        ciFilter.setValue(CIVector(x: 1.0, y: 1.0), forKey: "inputPoint4")
        self.ciContext = CIContext(options: nil)
        let cgimg:CGImage = ciContext.createCGImage(ciFilter.outputImage!, from:ciFilter.outputImage!.extent)!
        //image2に加工後のUIImage
        let image2:UIImage = UIImage(cgImage: cgimg, scale: 1.0, orientation:UIImageOrientation.up)
        editImageView.image = image2
        
    }
    
    func filter6(){
        let ciImage:CIImage = CIImage(image:editImageView.image!)!;
        let ciFilter:CIFilter = CIFilter(name: "CIHueAdjust" )!
        ciFilter.setValue(ciImage, forKey: kCIInputImageKey)
        ciFilter.setValue(3.14, forKey: "inputAngle")
        self.ciContext = CIContext(options: nil)
        let cgimg:CGImage = ciContext.createCGImage(ciFilter.outputImage!, from:ciFilter.outputImage!.extent)!
        //image2に加工後のUIImage
        let image2:UIImage = UIImage(cgImage: cgimg, scale: 1.0, orientation:UIImageOrientation.up)
        editImageView.image = image2
        
        
    }

    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
