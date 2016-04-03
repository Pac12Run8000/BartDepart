//
//  backTableVC.swift
//  BartDepart
//
//  Created by MIchelle Grover on 4/2/16.
//  Copyright © 2016 Norbert Grover. All rights reserved.
//

import Foundation

class backTableVC:UITableViewController {
    var tableArray = [String]()

    override func viewDidLoad() {
        tableArray = ["Overview", "Real Time Departures", "Route Info"]
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(tableArray[indexPath.row], forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = tableArray[indexPath.row]
        return cell
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    
    
}