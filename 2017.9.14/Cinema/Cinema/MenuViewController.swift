//
//  MenuViewController.swift
//  Cinema
//
//  Created by Benny Davidovitz on 18/09/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var heightLayout : NSLayoutConstraint!
    let tableArray = APIManager.Endpoint.all
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.selectRow(at: indexPath, animated: true, scrollPosition: .top)
        
        heightLayout.constant = 44 * CGFloat(tableArray.count)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuCell
        
        cell.configure(with: tableArray[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let nav = self.sideMenuViewController.contentViewController as? UINavigationController
        let center = nav?.viewControllers.first as? MoviesViewController
        
        center?.endpoint = tableArray[indexPath.row]
        
        self.sideMenuViewController.hideViewController()
    }
}




















