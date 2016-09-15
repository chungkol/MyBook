//
//  DetailViewController.swift
//  MyBooks
//
//  Created by Chung on 9/15/16.
//  Copyright © 2016 newayplus. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var mActivity: UIActivityIndicatorView!
    @IBOutlet weak var mWebView: UIWebView!
    var urlString: String!
    var type: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        let rightButton = UIBarButtonItem(image: UIImage(named: "time"), style: .Plain, target: self, action: #selector(DetailViewController.getTime(_:)))
        self.navigationItem.rightBarButtonItem = rightButton
        self.title = urlString
        self.mWebView.delegate = self
        self.mActivity.startAnimating()
        var urlPath  = "default"
        switch (type) {
        case "PDF": urlPath = NSBundle.mainBundle().pathForResource(urlString, ofType: "pdf")!
        case "DOCX": urlPath = NSBundle.mainBundle().pathForResource(urlString, ofType: "docx")!
        case "HTML": urlPath = NSBundle.mainBundle().pathForResource(urlString, ofType: "html")!
           
        default: break
            
        }
        
        let url: NSURL = NSURL.fileURLWithPath(urlPath)
        let urlRequest = NSURLRequest(URL: url)
        self.mWebView.loadRequest(urlRequest)
       
        
    }
    func webViewDidFinishLoad(webView: UIWebView) {
        self.mActivity.hidden = true
        self.mActivity.stopAnimating()
    }
    func getTime(sender: AnyObject){
        
        self.mWebView.stringByEvaluatingJavaScriptFromString("hello();")
        print("get time")
    }
    func showAlert(mes: String){
        let alert = UIAlertController(title: "Thông báo", message: mes, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Đóng", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
    }

    

}
