//
//  ViewController.swift
//  16_UIImageView
//
//  Created by Kristina Kostenko on 06.08.2024.
//

import UIKit

class ViewController: UIViewController {

    var myImageView = UIImageView()
    let macBookImage = UIImage(named: "programming")
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myImageView = UIImageView(frame: self.view.bounds)
        myImageView.contentMode = .scaleAspectFit
        myImageView.layer.cornerRadius = 50
        myImageView.clipsToBounds = true
        myImageView.image = macBookImage
        myImageView.center = view.center
        view.addSubview(myImageView)
    }


}

