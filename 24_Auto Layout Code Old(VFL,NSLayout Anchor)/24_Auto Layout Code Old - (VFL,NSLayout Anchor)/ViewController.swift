//
//  ViewController.swift
//  24_Auto Layout Guide Code(VFL,NSLayout Anchor)
//
//  Created by Kristina Kostenko on 16.08.2024.
//

import UIKit

class ViewController: UIViewController {

    let view1: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        view.backgroundColor = UIColor.red
        return view
    }()
    
    let view2: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        view.backgroundColor = UIColor.red
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(view1)
        view.addSubview(view2)
        createView1Constraint()
        createView2Constraint()
    }
    
     
//method that used long time ago
    func createView1Constraint() {
       /*
        
        NSLayoutConstraint(item: view1,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .leadingMargin,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: view1,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .trailingMargin,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: view1,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .topMargin,
                           multiplier: 1,
                           constant: 88).isActive = true
        NSLayoutConstraint(item: view1,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: view1,
                           attribute: .width,
                           multiplier: 1,
                           constant: 0).isActive = true
        */
        
        NSLayoutConstraint(item: view1,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: view1,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerY,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: view1,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: 200).isActive = true
        NSLayoutConstraint(item: view1,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: 200).isActive = true
    }
    
    
    func createView2Constraint() {
       
        NSLayoutConstraint(item: view2,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: view1,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        //distance between 2 views
        NSLayoutConstraint(item: view2,
                           attribute: .bottom,//bottom of view2
                           relatedBy: .equal,
                           toItem: view1,
                           attribute: .top,//top of view1
                           multiplier: 1,
                           constant: -8).isActive = true//distance
        NSLayoutConstraint(item: view2,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: 100).isActive = true
        NSLayoutConstraint(item: view2,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: 100).isActive = true
    }

     
        
}

