//
//  RoomsViewController.swift
//  ChitChat
//
//  Created by Benny Davidovitz on 25/09/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import Firebase

class RoomsViewController: UIViewController , UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    var tableArray : [Room] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        
        DBManager.manager.observeAllRooms {
            self.tableArray = $0
            self.tableView.reloadData()
        }
    }
    
    deinit {
        DBManager.manager.roomsRef.removeAllObservers()
    }

    @IBAction func signOutAction(_ sender: Any) {
        try? Auth.auth().signOut()
        
        FlowController.shared.determineRoot()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RoomCell
        
        let room = tableArray[indexPath.row]
        cell.configure(with: room)
        
        return cell
        
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