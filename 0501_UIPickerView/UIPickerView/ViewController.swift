//
//  ViewController.swift
//  UIPickerView
//
//  Created by Kristina Kostenko on 23.07.2024.
//

import UIKit

class ViewController: UIViewController {
    let picker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        picker.center = view.center
        
        //subscribe on protocol
        
        picker.dataSource = self
        picker.delegate = self
        
        self.view.addSubview(picker)
    }


}

extension ViewController: UIPickerViewDataSource {
    //one component
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //10 strings
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
    }

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let result = "row = \(row)"
        
        return result
    }

}
