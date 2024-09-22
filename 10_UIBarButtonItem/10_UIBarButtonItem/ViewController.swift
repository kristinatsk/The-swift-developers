//
//  ViewController.swift
//  10_UIBarButtonItem
//
//  Created by Kristina Kostenko on 30.07.2024.
//

import UIKit

class ViewController: UIViewController {

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //createImageTitleView()
        //self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(performAdd(param: )))
        
        createSwitchTitleView()
        
        title = "View Controller"
        
        let items = ["up", "down"]
        let segmentController = UISegmentedControl(items: items)
        //segmentController.isMomentary = true //disappear after tapped
        segmentController.addTarget(self, action: #selector(segmentControllerTapped(param: )), for: .valueChanged)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: segmentController)
    }
    
//MARK: Method
    
    /*
     fileprivate func createImageTitleView() {
             // Do any additional setup after loading the view.
             let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
             imageView.contentMode = .scaleAspectFit
             let image = UIImage(named: "apple")
             imageView.image = image
             
             self.navigationItem.titleView = imageView
         }
     */
     

     
    fileprivate func createSwitchTitleView() {
        let simpleSwitch = UISwitch()
        simpleSwitch.isOn = false
        simpleSwitch.addTarget(self, action: #selector(switchChange(param: )), for: .valueChanged)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: simpleSwitch)
    }
    
    //for camera right
     /*
      @objc func performAdd(param: UIBarButtonItem) {
                  print("Add click")
              }
      */
     
     
    
    @objc func switchChange(param: UISwitch) {
        if param.isOn {
            print("Switch is On")
        } else {
            print("Switch is Off")
        }
    }
   
    @objc func segmentControllerTapped(param: UISegmentedControl) {
        switch param.selectedSegmentIndex {
        case 0:
            print("up")
        case 1:
            print("down")
        default:
            break
        }
    }
}

