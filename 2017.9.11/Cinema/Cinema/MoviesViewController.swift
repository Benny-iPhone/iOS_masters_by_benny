//
//  MoviesViewController.swift
//  Cinema
//
//  Created by Benny Davidovitz on 11/09/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{

    var tableArray : [Movie] = []
    @IBOutlet weak var tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        refresh()
    }
    
    func refresh(){
        APIManager.shared.getMovies(endpoint: .nowPlaying, page: 1) {
            self.tableArray = $0
            self.tableView.reloadData()
        }
    }

    //MARK: - UITableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let obj = tableArray[indexPath.row]
        cell.textLabel?.text = obj.title
        cell.detailTextLabel?.text = obj.originalTitle
        
        return cell
    }
}










