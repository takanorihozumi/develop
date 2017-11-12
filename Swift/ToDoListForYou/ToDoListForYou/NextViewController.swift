//
//  NextViewController.swift
//  ToDoListForYou
//
//  Created by 穂積孝紀 on 2017/10/16.
//  Copyright © 2017年 com.hozumi. All rights reserved.
//

import UIKit

class NextViewController: UIViewController, UITextViewDelegate,UIDocumentInteractionControllerDelegate,UITextFieldDelegate {
    
    @IBOutlet var dateTextField: UITextField!
    
    lazy private var documentInteractionController = UIDocumentInteractionController()

    var selectedNumber = 0
    
    @IBOutlet var textView: UITextView!
    
    var screenShotImage:UIImage = UIImage()
    var titleArray:Array = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
        dateTextField.delegate = self
        
        initialiseDateField()

    }
    
    func initialiseDateField(){
        let datePicker = UIDatePicker()
        
        // ②日本の日付表示形式にする
        datePicker.locale = NSLocale(localeIdentifier: "ja_JP") as Locale
        datePicker.datePickerMode = UIDatePickerMode.date
        
        datePicker.addTarget(self, action: #selector(NextViewController.datePickerValueChanged(sender:)), for: UIControlEvents.valueChanged)
        
        dateTextField.inputView = datePicker
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
            textView.resignFirstResponder()
            
        }
        if dateTextField.isFirstResponder{
            dateTextField.resignFirstResponder()
        }
    }
    
    func takeScreenShot (){
        
        let rect = CGRect(x: textView.frame.origin.x, y: textView.frame.origin.y, width: textView.frame.width, height: textView.frame.height)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        textView.drawHierarchy(in: rect, afterScreenUpdates: true)
        screenShotImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()

    }

    @IBAction func shareLINE(_ sender: Any) {
        
        takeScreenShot()
        
        //timingを遅らせる
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
         
            let pastBoard: UIPasteboard = UIPasteboard.general
            
            pastBoard.setData(UIImageJPEGRepresentation(self.screenShotImage, 0.75)!, forPasteboardType: "public.png")
            
            let lineUrlString: String = String(format: "line://msg/image/%@", pastBoard.name as CVarArg)
            
            UIApplication.shared.open(NSURL(string: lineUrlString)! as URL)
            
        }
    }
    
    func datePickerValueChanged(sender: UIDatePicker) {
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ja_JP")
        formatter.dateStyle = DateFormatter.Style.medium
        formatter.timeStyle = DateFormatter.Style.none
        formatter.dateFormat = "yyyy年MM月dd日"
        dateTextField.text = formatter.string(from: sender.date)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
