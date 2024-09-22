//
//  ViewController.swift
//  17_ UIScrollView
//
//  Created by Kristina Kostenko on 07.08.2024.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    var myScrollView = UIScrollView()
    var myImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createScrollView()
    }

    func createScrollView() {
        let imageToLoad = UIImage(named: "programming")
        myImageView = UIImageView(image: imageToLoad)
        myScrollView = UIScrollView(frame: self.view.bounds)
        myScrollView.addSubview(myImageView)
        myScrollView.contentSize = self.myImageView.bounds.size
        myScrollView.delegate = self
        self.view.addSubview(myScrollView)
    }
    
    //MARK: - UIScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let p = "Scrolling is beginning"
        print(p)
        print(scrollView.contentOffset.y)
        self.myScrollView.alpha = 0.50
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let p = "Is calling after scrolling"
        print(p)
        self.myScrollView.alpha = 1.0
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let p = "Guarantees that returns alpha by 1"
        print(p)

        self.myScrollView.alpha = 1.0
    }

}

