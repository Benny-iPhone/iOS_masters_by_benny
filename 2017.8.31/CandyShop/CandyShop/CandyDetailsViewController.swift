//
//  CandyDetailsViewController.swift
//  CandyShop
//
//  Created by Benny Davidovitz on 31/08/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import SDWebImage

class CandyDetailsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    var candy : Candy!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = candy.name
        
        textView.text = candy.desc
        
        imageView.sd_setImage(with: candy.imageURL)
        
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
