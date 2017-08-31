//
//  ViewController.swift
//  GOTTableViewProject
//
//  Created by Benny Davidovitz on 31/08/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let tableArray : [[String]] = [
        ["Winter Is Coming","The Kingsroad","Lord Snow","Cripples, Bastards, and Broken Things","The Wolf and the Lion","A Golden Crown","You Win or You Die","The Pointy End","Baelor","Fire and Blood"],
        ["The North Remembers","The Night Lands","What Is Dead May Never Die","Garden of Bones","The Ghost of Harrenhal","The Old Gods and the New","A Man Without Honor","The Prince of Winterfell","Blackwater","Valar Morghulis"]
    ]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let section = indexPath.section
        let row = indexPath.row
        
        cell.textLabel?.text = tableArray[section][row]
        cell.detailTextLabel?.text = "episode \(row + 1)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Season \(section + 1)"
    }
    
    
}














