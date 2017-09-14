//
//  WebViewController.swift
//  Cinema
//
//  Created by Benny Davidovitz on 14/09/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView : UIWebView!
    var urlString : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        guard let urlString = urlString,
            let url = URL(string: urlString)
        else {
            return
        }
        
        webView.loadRequest(URLRequest(url: url))
        
        
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
