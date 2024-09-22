//
//  ViewController.swift
//  1701_ UIScrollView
//
//  Created by Kristina Kostenko on 07.08.2024.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    var myScrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let iPhoneImage = UIImage(named: "iphone")
        let iPadImage = UIImage(named: "ipad")
        let macBookImage = UIImage(named: "mac")
        
        let scrollViewRect = self.view.bounds
        
        //create scroll
        myScrollView = UIScrollView(frame: scrollViewRect)
        myScrollView.isPagingEnabled = true
        myScrollView.contentSize = CGSize(width: scrollViewRect.size.width * 3, height: scrollViewRect.size.height)
        self.view.addSubview(myScrollView)
        
        //create iphone
        var imageViewRect = self.view.bounds
        let iPhoneImageView = self.newImageViewWithImage(paramImage: iPhoneImage!, paramFrame: imageViewRect)
        myScrollView.addSubview(iPhoneImageView)
        
        //next page
        imageViewRect.origin.x += imageViewRect.size.width
        let iPadImageView = self.newImageViewWithImage(paramImage: iPadImage!, paramFrame: imageViewRect)
        self.myScrollView.addSubview(iPadImageView)
        
        //next page
        imageViewRect.origin.x += imageViewRect.size.width
        let macBookImageView = self.newImageViewWithImage(paramImage: macBookImage!, paramFrame: imageViewRect)
        self.myScrollView.addSubview(macBookImageView)
    }
    
    
    
    //newImageViewWithImage
    func newImageViewWithImage(paramImage: UIImage, paramFrame: CGRect) -> UIImageView {
        let result = UIImageView(frame: paramFrame)
        result.contentMode = .scaleAspectFit
        result.image = paramImage
        return result
    }

}

