//
//  ViewController.swift
//  05_UIDatePicker
//
//  Created by Kristina Kostenko on 23.07.2024.
//

import UIKit

class ViewController: UIViewController {

    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        datePicker.center = view.center
        self.view.addSubview(datePicker)
        
        datePicker.datePickerMode = .countDownTimer
        
        var oneYearTime = TimeInterval()
        oneYearTime = 365 * 24 * 60 * 60
        
        let todayDate = Date()
        
        let oneYearFromToday = todayDate.addingTimeInterval(oneYearTime)
        let twoYearsFromToday = todayDate.addingTimeInterval(oneYearTime * 2)
        
        datePicker.minimumDate = oneYearFromToday
        datePicker.maximumDate = twoYearsFromToday
        
        datePicker.countDownDuration = 2 * 60
        
        datePicker.addTarget(self, action: #selector(datePickerChanged(paramDatePicker:)), for: .valueChanged)
    }
    
    @objc func datePickerChanged(paramDatePicker: UIDatePicker){
        if paramDatePicker.isEqual(self.datePicker) {
            print("dateChange : = ", paramDatePicker.date)
        }

}


}

