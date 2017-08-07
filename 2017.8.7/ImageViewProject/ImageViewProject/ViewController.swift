//
//  ViewController.swift
//  ImageViewProject
//
//  Created by Benny Davidovitz on 07/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func radioBoxAction(_ sender: UITapGestureRecognizer) {
        
        guard let imageView = sender.view as? UIImageView else{
            return
        }
        
        imageView.isHighlighted = !imageView.isHighlighted
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let image = #imageLiteral(resourceName: "icon_heart")
        let rect = CGRect(x: 16, y: 16, width: image.size.width, height: image.size.height)
        let imageView = UIImageView(frame: rect)
        imageView.image = image
        
        self.view.addSubview(imageView)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

