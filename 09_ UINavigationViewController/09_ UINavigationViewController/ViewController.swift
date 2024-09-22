//
//  ViewController.swift
//  09_ UINavigationViewController
//
//  Created by Kristina Kostenko on 29.07.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var displaySecondButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "FirstVC"
        
        self.displaySecondButton = UIButton(type: .system)
        self.displaySecondButton.setTitle("SecondVC", for: .normal)
        self.displaySecondButton.sizeToFit()
        self.displaySecondButton.center = self.view.center
        self.displaySecondButton.addTarget(self, action: #selector(performDisplaySecondVC(parameterSender: )), for: .touchUpInside)
        self.view.addSubview(self.displaySecondButton)
    }
    
    @objc func performDisplaySecondVC(parameterSender: Any){
        
        let secondVC = SecondViewController()
        self.navigationController?.pushViewController(secondVC, animated: true)
    }


}

