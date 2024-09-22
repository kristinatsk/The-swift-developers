//
//  ViewController.swift
//  Alert
//
//  Created by Kristina Kostenko on 19.07.2024.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var hiLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func showButton(_ sender: Any) {
        self.hiLabel.text = "Hi,"
        self.alert(title: "Warning!", message: "Input your name", style: .alert)
        
    }
    
    func alert(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        
        let action = UIAlertAction(title: "ok", style: .default) { (action) in
            
            
            let text = alertController.textFields?.first
            self.hiLabel.text! += (text?.text!)! + ("!")
            
        }
        alertController.addTextField{ (textField) in
            //may use for password for example
            textField.isSecureTextEntry = true
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
}

