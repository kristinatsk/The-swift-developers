//
//  ViewController.swift
//  14_ UITextView
//
//  Created by Kristina Kostenko on 03.08.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var myTextView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        createTextView()
        
        
        //create observer for updateTextView func
        NotificationCenter.default.addObserver(self, selector: #selector(updateTextView), name: UIResponder.keyboardDidShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateTextView), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func createTextView() {
        myTextView = UITextView(frame: CGRect(x: 20, y: 100, width: self.view.bounds.width - 50, height: self.view.bounds.height / 2))
        myTextView.text = "Some text"
        myTextView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        myTextView.font = UIFont.systemFont(ofSize: 17)
        myTextView.backgroundColor = .gray
        self.view.addSubview(myTextView)
    }

    //hides keyboard when touch outside
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.myTextView.resignFirstResponder()
        self.myTextView.backgroundColor = .white //after finishing texting
    }
    
    //adopting keyboard size according the text size
    @objc func updateTextView(param: Notification) {
        let userInfo = param.userInfo
        
        //get keyboard's frame, get coordinates
        let getKeyboardRect = (userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        //convert to cgrect graphics
        let keyboardFrame = self.view.convert(getKeyboardRect, to: view.window)
        
        //if end typing - return to initial position
        if param.name == UIResponder.keyboardWillHideNotification {
            myTextView.contentInset = UIEdgeInsets.zero
        } else {//adopt to the text size according keyboard height
            myTextView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrame.height, right: 0)
            myTextView.scrollIndicatorInsets = myTextView.contentInset
        }
        
        //scroll until all text will be visible
        myTextView.scrollRangeToVisible(myTextView.selectedRange)
    }
}

