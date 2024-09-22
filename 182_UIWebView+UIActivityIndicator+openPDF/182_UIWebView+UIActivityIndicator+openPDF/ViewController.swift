//
//  ViewController.swift
//  182_UIWebView+UIActivityIndicator+openPDF
//
//  Created by Kristina Kostenko on 08.08.2024.
//

import UIKit
import WebKit
 
class ViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {

    
    @IBOutlet weak var goBackItem: UIBarButtonItem!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var goForwardItem: UIBarButtonItem!
    
    //let application = UIApplication.shared 45 str
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        webView.navigationDelegate = self
        
      
        
        
        if //let urlPdf = Bundle.main.url(forResource: "Frontend", withExtension: "pdf") {
            let myUrl = URL(string: "https://www.google.com") {
            let request = URLRequest(url: myUrl)
            
            print(myUrl.port, myUrl.user, myUrl.scheme)
            webView.load(request)
            
//            let request = URLRequest(url: urlPdf)
//            webView.load(request)
        }
    }
    
    
    //MARK: - Method
    func isWorkIndicator(isAnimated: Bool, indicator: UIActivityIndicatorView) {
        if isAnimated {
            activityIndicator.startAnimating()
            activityIndicator.isHidden = false
        } else {
            activityIndicator.stopAnimating()
            activityIndicator.isHidden = true
        }
    }
    
    //MARK: - UIWebViewDelegate
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        //application.isNetworkActivityIndicatorVisible = false //deprecated
        isWorkIndicator(isAnimated: true, indicator: activityIndicator)
        self.goForwardItem.isEnabled = false
        self.goBackItem.isEnabled = false
        
        if webView.canGoForward {
            self.goForwardItem.isEnabled = true
        }
        if webView.canGoBack {
            self.goBackItem.isEnabled = true
        }
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        isWorkIndicator(isAnimated: false, indicator: activityIndicator)
    }



    
     
    /*
     func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
         if let myUrl = URL(string: "https://www.google.com") {
             let request = URLRequest(url: myUrl)
             print("shouldStartLoadWith", request)
         }
         
     }
     */

    
    /*
     
     func webViewDidStartLoad(_ webView: WKWebView) {
         self.goBackItem.isEnabled = false
         self.goForwardItem.isEnabled = false
     }
     
     func webViewDidFinishLoad(_ webView: WKWebView) {
         if webView.canGoBack {
             self.goBackItem.isEnabled = true
         } else if webView.canGoForward {
             self.goForwardItem.isEnabled = true
         }
             
     }
     
    func webView(_ webView: WKWebView, shouldStartLoadWith request: URLRequest, navigationType: WKNavigationType) -> Bool {
         print("shouldStartLoadWith", request)
         return true
     }
     */

     

    
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

