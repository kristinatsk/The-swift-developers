//
//  ViewController.swift
//  UILabel
//
//  Created by Kristina Kostenko on 01.08.2024.
//

import UIKit

class ViewController: UIViewController {
    
    let myLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let labelFrame = CGRect(x: 0, y: 0, width: 100, height: 50)
        
        myLabel.frame = labelFrame
        myLabel.text = "IOS 17.5 and Xcode 15 and The Swift Developers"
        myLabel.numberOfLines = 0//when don't know how many strings do we need
        myLabel.lineBreakMode = .byWordWrapping
        myLabel.adjustsFontSizeToFitWidth = true
        myLabel.sizeToFit()
        myLabel.font = UIFont.boldSystemFont(ofSize: 24)
        myLabel.textColor = UIColor.black
        myLabel.shadowColor = UIColor.lightGray
        myLabel.shadowOffset = CGSize(width: 2, height: 2)
        myLabel.center = self.view.center
        view.addSubview(myLabel)
    }


}

