//
//  ViewController.swift
//  11_UITabBarController
//
//  Created by Kristina Kostenko on 31.07.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "FirstVC"
        
        var tabBarItem = UITabBarItem()
        tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        self.tabBarItem = tabBarItem
        //self.view.backgroundColor = UIColor.lightGray
    }


}

