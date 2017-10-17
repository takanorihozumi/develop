//
//  NextViewController.swift
//  ToDoListForYou
//
//  Created by 穂積孝紀 on 2017/10/16.
//  Copyright © 2017年 com.hozumi. All rights reserved.
//

import UIKit

class NextViewController: UIViewController, UITextViewDelegate {

    var selectedNumber = 0
    
    @IBOutlet var textView: UITextView!
    
    var screenShotImage:UIImage = UIImage()
    var titleArray:Array = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if UserDefaults.standard.object(forKey: "array") != nil {
            titleArray = UserDefaults.standard.object(forKey: "array") as![String]
            textView.text =  titleArray[selectedNumber]
        }
    }
    
    //touchしてキーボードを閉じる
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //keyboadが表示されているなら
        if textView.isFirstResponder{
            //close
            textView.resignFirstResponder()
        }
    }
    
    func takeScreenShot {
        
        let rect = CGRect(x: textView.frame.origin.x, y: textView.frame.origin.y, width: textView.frame.width, height: textView.frame.height)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        textView.drawHierarchy(in: rect, afterScreenUpdates: true)
        screenShotImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()

    }

    @IBAction func shareLINE(_ sender: Any) {
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
