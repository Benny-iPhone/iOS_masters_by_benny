//
//  ListViewController.swift
//  LocationProject
//
//  Created by Benny Davidovitz on 16/10/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tableArray : [Branch] = []
    @IBOutlet weak var tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Branches"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self

        refreshData()
        
        NotificationCenter.default.addObserver(forName: .locationUpdate, object: nil, queue: .main) { (note) in
            //location update, lets refresh tableview
            
            self.refreshData()
        }
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func refreshData(){
        let arr = Branch.allBranches()
        guard let userLocation = AppManager.manager.location else{
            self.tableArray = arr
            self.tableView.reloadData()
            return
        }
        self.tableArray = arr.sorted(by: { (b1, b2) -> Bool in
            return b1.location.distance(from: userLocation) < b2.location.distance(from: userLocation)
        })
        
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BranchCell
        
        let b = tableArray[indexPath.row]
        cell.configure(with: b)
        
        return cell
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
