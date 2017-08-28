//
//  ViewController.swift
//  TableViewProject
//
//  Created by Benny Davidovitz on 28/08/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import CRToast

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{

    func numberOfSections(in tableView: UITableView) -> Int {
        return 10_000
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section + 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "Row \(indexPath.row)"
        cell.textLabel?.backgroundColor = .clear
        
        let isZugi = indexPath.row % 2 == 0
        cell.contentView.backgroundColor = isZugi ? .lightGray : .white
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let text = "selected row \(indexPath.row) in section \(indexPath.section)"
        print(text)
        
        CRToastManager.showNotification(withMessage: text, completionBlock: nil)
        /*
        let dict : [String:Any] = [
            kCRToastTextKey:"test",
            kCRToastTextAlignmentKey:NSTextAlignment.center,
            kCRToastBackgroundColorKey:UIColor.red,
            kCRToastAnimationInTypeKey:CRToastAnimationType.gravity,
            kCRToastAnimationOutTypeKey:CRToastAnimationType.gravity,
            kCRToastAnimationInDirectionKey:CRToastAnimationDirection.left,
            kCRToastAnimationOutDirectionKey:CRToastAnimationDirection.right
        ]
        
        CRToastManager.showNotification(options: dict, apperanceBlock: nil, completionBlock: nil)*/
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
















