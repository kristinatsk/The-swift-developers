//
//  ViewController.swift
//  06_UISlider
//
//  Created by Kristina Kostenko on 24.07.2024.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
//Outlets
    
    @IBOutlet weak var volumeSlider: UISlider!
    var player = AVAudioPlayer()
    let slider = UISlider()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //slider
        self.slider.frame = CGRect(x: 0, y: 0, width: 230, height: 23)
        self.slider.center = self.view.center
        self.slider.minimumValue = 0.0
        self.slider.maximumValue = 100.0
        self.view.addSubview(slider)
        
        
        //add target
        self.slider.addTarget(self, action: #selector(changeSlider), for: .valueChanged)
        
        do {
            if let audioPath = Bundle.main.path(forResource: "Benson Boone - Beautiful Things (Official Music Video)", ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                self.slider.maximumValue = Float(player.duration)
            }
        } catch  {
            print("Error")
        }
        self.player.play()
    }
    
    // MARK: Method
    @objc func changeSlider(sender: UISlider) {
        if sender == slider {
            self.player.currentTime = TimeInterval(sender.value)
        }
    }

    //MARK: Actions

    @IBAction func playButton(_ sender: Any) {
        self.player.play()
    }
    
    
    @IBAction func pauseButton(_ sender: Any) {
        self.player.pause()
    }
    
    @IBAction func volumeSliderAction(_ sender: Any) {
        self.player.volume = self.volumeSlider.value
    }
}

