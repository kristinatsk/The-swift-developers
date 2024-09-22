//
//  ViewController.swift
//  25_UITableView
//
//  Created by Kristina Kostenko on 17.08.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    

    var myTableView = UITableView()
    let identifier = "MyCell"
    var array = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    override func viewDidLoad() {
        super.viewDidLoad()
        createTable()

    }
    
    func createTable() {
        
        self.myTableView = UITableView(frame: view.bounds, style: .plain)
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        
        myTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        view.addSubview(myTableView)
    }

    
    //MARK: - UITableViewDataSource
    
    /*
     func numberOfSections(in tableView: UITableView) -> Int {
         return 3
     }
     */

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       /*
        switch section {
                case 0:
                    return 3
                case 1:
                    return 5
                case 2:
                    return 8
                default:
                    break
                }
        */
        
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        let number = array[indexPath.row]
        
        cell.textLabel?.text = number//"section = \(indexPath.section) cell = \(indexPath.row)"
        /*
         cell.accessoryType = .detailButton
                
                switch indexPath.section {
                case 0:
                    cell.backgroundColor = UIColor.red
                case 1:
                    cell.backgroundColor = UIColor.blue
                case 2:
                    cell.backgroundColor = UIColor.orange
                default:
                    break
                }
         */
       
        
        return cell
    }
    
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //size of cell
        return 70.0
    }
    
    /*
     func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
             print("Accessory path = ", indexPath)
             let ownerCell = tableView.cellForRow(at: indexPath)
             print("Cell title = ", ownerCell?.textLabel?.text ?? "nil")
         }
     */
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        //print(indexPath.row)
        let number = array[indexPath.row]
        print(number)
    }
}

