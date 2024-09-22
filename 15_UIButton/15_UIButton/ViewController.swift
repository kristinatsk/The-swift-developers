//
//  ViewController.swift
//  15_UIButton
//
//  Created by Kristina Kostenko on 05.08.2024.
//

import UIKit

class ViewController: UIViewController {
//outlet, action, outlet collection - array of elements
    var myButton = UIButton()
    let normalImage = UIImage(named: "1")
    let highlightedImage = UIImage(named: "2")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        myButton = UIButton(type: .roundedRect)
        myButton.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        myButton.center = self.view.center
        myButton.setTitle("1", for: .normal)
        myButton.setTitle("2", for: .highlighted)
        myButton.addTarget(self, action: #selector(buttonIsPressed), for: .touchDown)///pressed but not leave finger
        myButton.addTarget(self, action: #selector(buttonIsTapped), for: .touchUpInside)
        self.view.addSubview(myButton)
        
        myButton.setBackgroundImage(normalImage, for: .normal)
        myButton.setBackgroundImage(highlightedImage, for: .highlighted)//pressed 
    }


    @objc func buttonIsPressed(sender: UIButton) {
        print("Button is pressed")
    }
    
    @objc func buttonIsTapped(sender: UIButton) {
        print("Button is tapped")
    }
}

