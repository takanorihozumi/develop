//
//  ViewController.swift
//  ToDoListForYou
//
//  Created by 穂積孝紀 on 2017/10/16.
//  Copyright © 2017年 com.hozumi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {

    @IBOutlet var backImageView: UIImageView!
    @IBOutlet var backView: UIView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var textField: UITextField!
    
    //TO DOのタイトル格納用array
    var titleArray = [String]()
    
    var label:UILabel = UILabel()
    
    //選択されたセルの番号を入れる
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        textField.delegate = self
        //角を丸くする
        backView.layer.cornerRadius = 2.0
        
        //tableViewはわけない
        tableView.separatorStyle = .none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //app内に保存されているデータを取得
        
        //titleを取得
        if UserDefaults.standard.object(forKey: "array") != nil {
            titleArray = UserDefaults.standard.object(forKey: "array") as! [String]
            
        }
        //画像を取得
        if UserDefaults.standard.object(forKey: "image") != nil {
            let numberString = UserDefaults.standard.object(forKey: "image")
            
            //TO DO 拡張子指定してるから注意
            backImageView.image = UIImage(named: numberString as! String + ".jpg")
        }
        
        tableView.reloadData()
        
    }
    
    //textfieldでreturn keyが押されえた場合の処理を書くdelegate method
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //配列の中に文字を入れる
        titleArray.append(textField.text!)
        
        //配列をアプリ内に保存
        UserDefaults.standard.set(titleArray, forKey: "array")
        
        if UserDefaults.standard.object(forKey: "array") != nil {
            titleArray = UserDefaults.standard.object(forKey: "array") as! [String]
            textField.text = ""
            tableView.reloadData()
        }
        
        //キーボードを閉じる
        textField.resignFirstResponder()
        
        return true
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 107
    }

    //delegate method1
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //delegate method2
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        
        //cellの角を丸くする
        cell.layer.cornerRadius = 10.0
        
        label = cell.contentView.viewWithTag(1) as! UILabel
        
        label.text = titleArray[indexPath.row]
        
        return cell
    }
    
    //delegate method3
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    //cellがtapされた際の処理
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //値を渡して画面遷移する
        count = Int(indexPath.row/*tapされたrowが入る*/)
        
        //画面遷移
        performSegue(withIdentifier: "next", sender: nil)
    }
    
    //遷移先に値を渡したい時に使うmethod
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "next" {
            let nextViewController:NextViewController = segue.destination as! NextViewController
            nextViewController.selectedNumber = count
            
        }
    }
    
    //cellの編集
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //titleArrayの選択された番号の文字が入っている配列の文字を削除
            titleArray.remove(at: indexPath.row)
            
            UserDefaults.standard.set(titleArray, forKey: "array")
            
            tableView.reloadData()
        } else if editingStyle == .insert {
            // TO DO
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

