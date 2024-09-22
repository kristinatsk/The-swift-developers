//
//  ViewController.swift
//  Switch
//
//  Created by Kristina Kostenko on 22.07.2024.
//

import UIKit

class ViewController: UIViewController {
    
   // let mySwitch = UISwitch()
    
    let mySwitch2 = UISwitch()
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //first var of creating
        
        /*
         
        self.mySwitch.frame = CGRect(x: 100, y: 100, width: 0, height: 0)
         self.view.addSubview(self.mySwitch)
         
         self.mySwitch.setOn(true, animated: true)
         
         if self.mySwitch.isOn {
             print("sw on")
         } else {
             print("sw off")
         }
         
         self.mySwitch.addTarget(self, action: #selector(switchChange(paramTarget:)), for: .valueChanged)
         
         */
        //switch
        self.mySwitch2.frame = CGRect.zero
        self.mySwitch2.center = self.view.center
        self.view.addSubview(self.mySwitch2)
        
        //off
        self.mySwitch2.tintColor = UIColor.yellow
        
        //arm
        self.mySwitch2.thumbTintColor = UIColor.red
        
        //on
        self.mySwitch2.onTintColor = UIColor.blue
        
        self.mySwitch2.addTarget(self, action: #selector(isOn(target:)), for: .valueChanged)
        
        
        
        //button
        self.button.frame = CGRect(x: 100, y: 200, width: 200, height: 100)
        self.button.backgroundColor = UIColor.orange
        self.button.setTitle("OK", for: .normal)
        self.button.setTitle("Pressed", for: .highlighted)
        
        
        //to appear button on the screen
        self.view.addSubview(self.button)
        

    }
    
    
    //for first var
    /*
     @objc func switchChange(paramTarget: UISwitch) {
         print("param is = ", paramTarget)
         
         if paramTarget.isOn {
             print("sw on")
         } else {
             print("sw off")
         }
     }
     */

    @objc func isOn(target: UISwitch){
        
        if target.isOn {
            self.button.isUserInteractionEnabled = false
        } else {
            self.button.isUserInteractionEnabled = true
        }
    }
    
    
}

