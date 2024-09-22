//
//  ViewController.swift
//  18_UIWebView+UIActivityIndicator+openPDF
//
//  Created by Kristina Kostenko on 08.08.2024.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var goBackItem: UIBarButtonItem!
    
    @IBOutlet weak var goForwardItem: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let myUrl = URL(string: "https://www.google.com") {
            let request = URLRequest(url: myUrl)
            
            webView.load(request)
        }
    }

    //MARK: - Action
    @IBAction func goBackAction(_ sender: Any) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @IBAction func goForwardAction(_ sender: Any) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    
    @IBAction func refreshAction(_ sender: Any) {
        webView.reload()
    }
}

