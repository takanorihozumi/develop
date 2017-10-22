//
//  EditViewController.swift
//  SNSCatchUp
//
//  Created by 穂積孝紀 on 2017/10/22.
//  Copyright © 2017年 com.hozumi. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet var editImageVIew: UIImageView!
    var willEdit :UIImage = UIImage()
    
    @IBOutlet var sc: UIScrollView!
    
    //scrollView用
    var uv = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        editImageVIew.image = willEdit
        
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
        editImageVIew.image = willEdit
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
