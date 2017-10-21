//
//  ViewController.swift
//  Swift4DatePickerCatchUp
//
//  Created by 穂積孝紀 on 2017/10/21.
//  Copyright © 2017年 com.hozumi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var dateTextField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateTextField.delegate = self
        
        let datePicker = UIDatePicker()
        
        // ②日本の日付表示形式にする
        datePicker.locale = NSLocale(localeIdentifier: "ja_JP") as Locale
        datePicker.addTarget(self, action: #selector(ViewController.datePickerValueChange(sender:)), for: UIControlEvents.valueChanged)
        dateTextField.inputView = datePicker
        
        
    }
    
    @objc func datePickerValueChange (sender: UIDatePicker){
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ja_JP")
        formatter.dateStyle = DateFormatter.Style.medium
        
        formatter.timeStyle = DateFormatter.Style.none
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        dateTextField.text = formatter.string(from: sender.date)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        dateTextField.resignFirstResponder()
        
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

}

