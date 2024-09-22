//
//  MyTableViewController.swift
//  26 _StoryBoard - UITableViewController,MVC,UserDefaults
//
//  Created by Kristina Kostenko on 18.08.2024.
//

import UIKit

class MyTableViewController: UITableViewController {
    //Dynamic
   // var itemArray = [Model]()
    
    //Static
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var isNotificationSwitch: UISwitch!
    @IBOutlet weak var genderSegment: UISegmentedControl!
    //single tone to save on the disk
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let item = Model(name: "Vladimir Nikolaev", prof: "driver")
//        itemArray.append(item)
        
        //load
        if let name = userDefaults.object(forKey: "name") {
            nameTextField.text = name as? String
        }
        if let last = userDefaults.object(forKey: "lastName") {
            lastNameTextField.text = last as? String
        }
        if let isSwitch = userDefaults.object(forKey: "switch") {
            isNotificationSwitch.isOn = isSwitch as! Bool
        }
        
        if let gender = userDefaults.object(forKey: "segment") {
            genderSegment.selectedSegmentIndex = gender as! Int
        }
    }
    
    // MARK: - Table view data source
    
    /*
     
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         // #warning Incomplete implementation, return the number of rows
         return itemArray.count
     }
     
     
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? MyTableViewCell {
             
             let item = itemArray[indexPath.row]
             
             cell.refresh(item)
             // Configure the cell...
             
             return cell
         }
         return UITableViewCell()
         
     }
     
     override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 100
     }
     */
    
    
    @IBAction func saveButton(_ sender: UIButton) {
        userDefaults.setValue(nameTextField.text, forKey: "name")
        userDefaults.setValue(lastNameTextField.text, forKey: "lastName")
        userDefaults.set(isNotificationSwitch.isOn, forKey: "switch")
        userDefaults.set(genderSegment.selectedSegmentIndex, forKey: "segment")
        print("saved")
        lastNameTextField.resignFirstResponder()

        
    }
    
}
