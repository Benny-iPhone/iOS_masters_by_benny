//
//  ViewController.swift
//  CandyShop
//
//  Created by Benny Davidovitz on 31/08/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var tableView : UITableView!
    let tableArray : [Candy]
    
    required init?(coder aDecoder: NSCoder) {
        let path = Bundle.main.path(forResource: "list", ofType: "plist")!
        let rawArr = NSArray(contentsOfFile: path) as! [[String:Any]]
        
        self.tableArray = rawArr.flatMap{Candy($0)}
        
        super.init(coder: aDecoder)
        /*
        self.tableArray = rawArr.flatMap({ (dict : [String : Any]) -> Candy in
            return Candy(dict)
        })*/
        
        
        /*
        var finalArray : [Candy] = []
        for dict in rawArr{
            finalArray.append(Candy(dict))
        }
        self.tableArray = finalArray
 */
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CandyCell
        
        let candy = tableArray[indexPath.row]
        //cell.textLabel?.text = candy.name
        
        cell.configure(with: candy)
        
        return cell
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextVC = segue.destination as? CandyDetailsViewController,
            let indexPath = tableView.indexPathForSelectedRow
            {
            
            nextVC.candy = tableArray[indexPath.row]
            
        }
    }

}



















