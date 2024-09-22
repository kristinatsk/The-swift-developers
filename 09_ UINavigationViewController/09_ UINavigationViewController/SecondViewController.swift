//
//  SecondViewController.swift
//  09_ UINavigationViewController
//
//  Created by Kristina Kostenko on 29.07.2024.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "SecondVC"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.perform(#selector(goBack), with: nil, afterDelay: 3.0)
    }

    @objc func goBack() {
       // self.navigationController?.popViewController(animated: true)
        
        //Get current array of controllers
        var currentControllerArray = self.navigationController?.viewControllers
        
        //delete last controller
        currentControllerArray?.removeLast()
        
        //Assign
        
//        if let newController = currentControllerArray {
//            self.navigationController?.viewControllers = newController
//        }
        //another of above
        guard let newController = currentControllerArray else {return}
        self.navigationController?.viewControllers = newController
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
