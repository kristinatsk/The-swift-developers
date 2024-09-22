//
//  ViewController.swift
//  26 _UITableViewController,MVC,UserDefaults
//
//  Created by Kristina Kostenko on 18.08.2024.
//

import UIKit

class ViewController: UIViewController {
    let tableViewController = UITableViewController(style: .plain)
    var refresh = UIRefreshControl()
    
    var allTime = [Date]()//["Robbins", "Jobs", "Gilbert"]
    var cellIdentifier = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.refresh.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        self.refresh.tintColor = UIColor.red
        
        createTableView()
        view.addSubview(tableViewController.tableView)
        tableViewController.tableView.addSubview(refresh)
    }

    
    @objc func handleRefresh() {
        allTime.append(Date())
        refresh.endRefreshing()
        let indexPathNewRow = IndexPath(row: allTime.count - 1, section: 0)
        tableViewController.tableView.insertRows(at: [indexPathNewRow], with: .automatic)
    }
    
    func createTableView() {
        tableViewController.tableView = UITableView(frame: view.bounds, style: .plain)

        tableViewController.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableViewController.tableView.delegate = self
        tableViewController.tableView.dataSource = self
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allTime.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        let date = allTime[indexPath.row]
        cell.textLabel?.text = "\(date)"
        return cell
    }
    
    
}
