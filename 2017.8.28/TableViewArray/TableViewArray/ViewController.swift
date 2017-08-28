//
//  ViewController.swift
//  TableViewArray
//
//  Created by Benny Davidovitz on 28/08/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var tableArray : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self
    }

    @IBAction func addAction(_ sender: Any) {
        
        let alert = UIAlertController(title: "Add", message: nil, preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "type a name"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        func handler(_ action : UIAlertAction){
            guard let text = alert.textFields?.first?.text else{
                return
            }
            
            //add data
            self.tableArray.insert(text, at: 0)
            //add ui
            let index = IndexPath(row: 0, section: 0)
            self.tableView.insertRows(at: [index], with: .right)
        }
        
        alert.addAction(UIAlertAction(title: "Submit", style: .default, handler: handler))
        
        self.present(alert, animated: true, completion: nil)
        
    }

}

extension ViewController : UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = tableArray[indexPath.row]
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            //remove data
            tableArray.remove(at: indexPath.row)
            //remove ui
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
    
}
























