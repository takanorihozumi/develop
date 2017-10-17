//
//  WebViewController.swift
//  Swift4TableView
//
//  Created by 穂積孝紀 on 2017/10/14.
//  Copyright © 2017年 com.hozumi. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        webView.delegate = self
        let url = URL(string: "https://qiita.com/suisuina/items/ee505ae51a2d36099424")
        
        let urlRequest = URLRequest(url: url!)
        webView.loadRequest(urlRequest)
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func susumu(_ sender: Any) {
        webView.goForward()
    }
    
    
    @IBAction func modoru(_ sender: Any) {
        webView.goBack()
    }
    
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
