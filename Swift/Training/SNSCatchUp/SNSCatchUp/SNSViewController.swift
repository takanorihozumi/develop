//
//  SNSViewController.swift
//  SNSCatchUp
//
//  Created by 穂積孝紀 on 2017/10/27.
//  Copyright © 2017年 com.hozumi. All rights reserved.
//

import UIKit

class SNSViewController: UIViewController {

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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
