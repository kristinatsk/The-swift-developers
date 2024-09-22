//
//  ViewController.swift
//  07_UISegmentControll
//
//  Created by Kristina Kostenko on 25.07.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var segmentControl = UISegmentedControl()
    var imageView = UIImageView()
    var menuArray = ["one", "two", "three"]
    var imagesArray = [UIImage(named: "blueBird.jpeg"),
                       UIImage(named: "abstraction.jpeg"),
                       UIImage(named: "colored.jpeg")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //image
        self.imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        self.imageView.center = self.view.center
        self.imageView.image = self.imagesArray[0]
        self.view.addSubview(self.imageView)
        
        //create segment
        self.segmentControl = UISegmentedControl(items: self.menuArray)
        self.segmentControl.frame = CGRect(x: 100, y: 550, width: 200, height: 30)
        self.view.addSubview(self.segmentControl)
        
        self.segmentControl.addTarget(self, action: #selector(selectedValue(target:)), for: .valueChanged)
    }

    @objc func selectedValue(target: UISegmentedControl) {
        if target == self.segmentControl {
            let segmentIndex = target.selectedSegmentIndex
            
            self.imageView.image = self.imagesArray[segmentIndex]
            
            let imageTitle = target.titleForSegment(at: segmentIndex)
            print(imageTitle ?? "")
        }
    }
    
}

