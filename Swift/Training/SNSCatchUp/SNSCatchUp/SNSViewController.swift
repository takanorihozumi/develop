//
//  SNSViewController.swift
//  SNSCatchUp
//
//  Created by 穂積孝紀 on 2017/10/27.
//  Copyright © 2017年 com.hozumi. All rights reserved.
//

import UIKit
import Social
class SNSViewController: UIViewController {

    //SNS用
    var composeController:SLComposeViewController!
    
    @IBOutlet var endImageView: UIImageView!
    
    @IBOutlet var textView: UITextView!
    
    var endImage:UIImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        endImageView.image = endImage
    }

    @IBAction func saveImage(_ sender: Any) {
        
    }
    
    @IBAction func shareSNS(_ sender: Any) {
        
    }
    
    //twitterに投稿
    func postTwitter(){
        //インスタンス化
        composeController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
        //投稿したいテキストを指定
        composeController.setInitialText(textView.text)
        //投稿する画像を指定
        composeController.add(endImageView.image)
        // SLComposeViewController を表示する(投稿画面が立ち上がる)
        self.present(composeController, animated: true, completion: nil)
    }
    //facebookに投稿
    func postFacebook(){
        //インスタンス化
        composeController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        //投稿したいテキストを指定
        composeController.setInitialText(textView.text)
        //投稿する画像を指定
        composeController.add(endImageView.image)
        // SLComposeViewController を表示する(投稿画面が立ち上がる)
        self.present(composeController, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
