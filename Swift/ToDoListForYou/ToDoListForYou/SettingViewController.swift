//
//  SettingViewController.swift
//  ToDoListForYou
//
//  Created by 穂積孝紀 on 2017/10/16.
//  Copyright © 2017年 com.hozumi. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet var sv: UIScrollView!
    @IBOutlet var backImageView: UIImageView!
    
    var vc:UIView = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vc.frame = CGRect(x: 0, y: 0, width: 800, height: 80)
        
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
    
    func selectImage(sender:UIButton) {
        //画像をUIImageViewに反映する
        backImageView.image = UIImage(named: String(sender.tag) + ".jpg")
        
        //buttonのtag情報をアプリ内に保存
        UserDefaults.standard.set(String(sender.tag), forKey: "image")
    }

    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
