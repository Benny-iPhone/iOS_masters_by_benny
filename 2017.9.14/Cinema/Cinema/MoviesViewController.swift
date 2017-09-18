//
//  MoviesViewController.swift
//  Cinema
//
//  Created by Benny Davidovitz on 11/09/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import CCBottomRefreshControl
import Toast

class MoviesViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{

    var tableArray : [Movie] = []
    var endpoint : APIManager.Endpoint = .nowPlaying{
        didSet{
            self.tableArray = []
            self.tableView.reloadData()
            
            reload()
            navigationItem.title = endpoint.name
        }
    }
    
    @IBOutlet weak var tableView : UITableView!
    weak var refreshControl : UIRefreshControl?
    var page : Int = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        self.view.backgroundColor = .clear
        self.navigationController?.view.backgroundColor = .clear
        
        tableView.backgroundColor = .clear
        
        self.endpoint = .nowPlaying

        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(reload), for: .valueChanged)
        tableView.addSubview(refreshControl)
        refreshControl.tintColor = .white
        
        self.refreshControl = refreshControl
        
        let bottomRefreshControl = UIRefreshControl()
        bottomRefreshControl.triggerVerticalOffset = 100 //points
        bottomRefreshControl.addTarget(self, action: #selector(loadNextPage), for: .valueChanged)
        tableView.bottomRefreshControl = bottomRefreshControl
        
        //refresh()
        
//        let button = UIBarButtonItem(title: "next page", style: .done, target: self, action: #selector(loadNextPage))
//        navigationItem.rightBarButtonItem = button
    }
    
    func loadNextPage(){
        page += 1
        refresh()
    }
    
    func reload(){
        page = 1
        refresh()
    }
    
    func refresh(){
        APIManager.shared.getMovies(endpoint: self.endpoint, page: page) {
            self.refreshControl?.endRefreshing()
            self.tableView.bottomRefreshControl?.endRefreshing()
            
            if let str = $1?.localizedDescription{
                self.view.makeToast(str)
                return
            }
            
            if self.page == 1{
                self.tableArray = $0
            } else {
                self.tableArray += $0
            }
            self.tableView.reloadData()
        }
    }

    //MARK: - UITableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieCell
        
        let obj = tableArray[indexPath.row]
        cell.configure(with: obj)
        //cell.textLabel?.text = obj.title
        //cell.detailTextLabel?.text = obj.originalTitle
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextVC = segue.destination as? MovieDetailsViewController,
            let indexPath = tableView.indexPathForSelectedRow{
            
            nextVC.movie = tableArray[indexPath.row]
            
        }
    }
    
    
}





















