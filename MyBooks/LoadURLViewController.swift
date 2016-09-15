//
//  LoadURLViewController.swift
//  MyBooks
//
//  Created by Chung on 9/15/16.
//  Copyright © 2016 newayplus. All rights reserved.
//

import UIKit

class LoadURLViewController: UIViewController, UITextFieldDelegate, UIWebViewDelegate {
    
    @IBOutlet weak var tfSearch: UITextField!
    
    @IBOutlet weak var mWebView: UIWebView!
    
    @IBOutlet weak var mActivity: UIActivityIndicatorView!
    
    let baseURL = "http://www."
    
    override func viewDidLoad() {
        mActivity.hidden = true
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        mActivity.hidden = false
        let url = NSURL(string: baseURL + textField.text!)
        let urlRequest = NSURLRequest(URL: url!)
        self.mWebView.loadRequest(urlRequest)
        mActivity.startAnimating()
        return true
    }
    func webViewDidFinishLoad(webView: UIWebView) {
        mActivity.hidden = true
        mActivity.stopAnimating()
    }
    
    
}
