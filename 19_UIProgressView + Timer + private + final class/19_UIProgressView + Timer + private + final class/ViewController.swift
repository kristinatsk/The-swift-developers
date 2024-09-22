//
//  ViewController.swift
//  19_UIProgressView + Timer + private + final class
//
//  Created by Kristina Kostenko on 10.08.2024.
//

import UIKit

final class ViewController: UIViewController {
    
//Outlet
    @IBOutlet weak var myProgressView: UIProgressView!
    
    //Variable
    private var myButton = UIButton()
    private var myTimer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createProgress(myProgressView)
        createButton(myButton)
        createTimer()
    }
    //MARK: - Timer
    private func createTimer() {
        myTimer = Timer.scheduledTimer(timeInterval: 1,
                                       target: self,
                                       selector: #selector(updateProgressView),
                                       userInfo: nil, repeats: true)
    }
    
    //MARK: - Selector
    @objc private func updateProgressView() {
        if myProgressView.progress != 1.0 {
            myProgressView.progress += 0.1 / 1.0
        } else if myProgressView.progress == 1.0 {
            UIView.animate(withDuration: 0.7) {
                self.myButton.alpha = 1
                self.myButton.setTitle("Start", for: .normal)
                self.myTimer.invalidate()
            }
        }
    }
    //MARK: - UI
    private func createProgress(_ progressView: UIProgressView) {
        progressView.progressViewStyle = .bar
        progressView.frame = CGRect(x: view.center.x,
                                    y: view.center.y,
                                    width: 150, height: 50)
        progressView.setProgress(0.0, animated: false)
        progressView.progressTintColor = UIColor.green
        progressView.trackTintColor = UIColor.gray
        progressView.center = view.center
        view.addSubview(progressView)
    }
    
    private func createButton(_ button: UIButton) {
        button.frame = CGRect(x: view.bounds.size.width / 3.3,
                              y: view.center.y + 100,
                              width: 150, height: 50)
        button.alpha = 0.7
        button.setTitle("Loading...", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .red
        view.addSubview(button)
    }


}

