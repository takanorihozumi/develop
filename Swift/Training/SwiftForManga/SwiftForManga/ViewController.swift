//
//  ViewController.swift
//  SwiftForManga
//
//  Created by 穂積孝紀 on 2017/10/02.
//  Copyright © 2017年 com.hozumi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var countLabel: UILabel!
    @IBOutlet var runnerImageView: UIImageView!
    var imageArray = [UIImage]()
    var timer1 = Timer()
    var timer2 = Timer()
    var countUp = 0
    var updateCount = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        let hoz1 = UIImage(named: "gob.jpg")
        let hoz2 = UIImage(named: "japanesegoblin.jpeg")
        let hoz3 = UIImage(named: "images.jpeg")
        let hoz4 = UIImage(named: "images.png")
        let hoz5 = UIImage(named: "ue.jpg")
        imageArray = [hoz1!,hoz2!,hoz3!,hoz4!,hoz5!]
        runnerImageView.image = hoz1
    }

    @IBAction func run(_ sender: Any) {
        timer1 = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (timer) in
            self.countUp = self.countUp + 1
            self.countLabel.text = String(self.countUp)
        })
        

            timer2 = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (timer) in
                            if (self.updateCount > 5){
                                self.runnerImageView.image = UIImage(named: "gob.jpg")
                            } else {
                                self.runnerImageView.image = self.imageArray[self.updateCount]
                            }
                            self.updateCount = self.updateCount + 1
                if (self.updateCount == 5){
                    self.updateCount = 0
                }
            })
        
            
           
        
            
            
        
            
        
    }
    
    @IBAction func stop(_ sender: Any) {
        timer1.invalidate()
        timer2.invalidate()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

