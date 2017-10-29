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
        let alertController = UIAlertController(title: "SNSへ投稿",
                                                message: "投稿する場所を選択してください。",
                                                preferredStyle: .actionSheet)
        
        let cancelAction:UIAlertAction = UIAlertAction(title: "Cancel",
                                                       style: UIAlertActionStyle.cancel,
                                                       handler:{
                                                        (action:UIAlertAction!) -> Void in
                                                        
                                                        //キャンセルボタンの処理
        })
        
        let facebookAction:UIAlertAction = UIAlertAction(title: "Facebook",
                                                         style: UIAlertActionStyle.default,
                                                         handler:{
                                                            (action:UIAlertAction!) -> Void in
                                                                                            self.postFacebook()
        })
        
        let twitterAction:UIAlertAction = UIAlertAction(title: "twitter",
                                                         style: UIAlertActionStyle.default,
                                                         handler:{
                                                            (action:UIAlertAction!) -> Void in
                                                            self.postTwitter()
        })
        alertController.addAction(facebookAction)
        alertController.addAction(twitterAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
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
