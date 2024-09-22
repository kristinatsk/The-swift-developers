//
//  ViewController.swift
//  2401_Auto Layout Modern
//
//  Created by Kristina Kostenko on 16.08.2024.
//

import UIKit

class ViewController: UIViewController {

    let viewRed: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.red
        return view
    }()
    
    let viewBlue: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.blue
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(viewRed)
        view.addSubview(viewBlue)
        
        let viewVFL = ["viewRed": viewRed, "viewBlue": viewBlue]
        let metrics = ["height": 100, "width": view.bounds.size.width / 3, "top": view.bounds.size.height / 2]
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-top-[viewRed(height)]|",
                                                           options: [],
                                                           metrics: metrics,
                                                           views: viewVFL))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-top-[viewBlue(height)]|",
                                                           options: [],
                                                           metrics: metrics,
                                                           views: viewVFL))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[viewRed(width)]-(50)-[viewBlue(width)]-|",
                                                           options: [],
                                                           metrics: metrics,
                                                           views: viewVFL))

    }


}

