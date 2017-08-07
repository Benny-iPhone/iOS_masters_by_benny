//
//  ViewController.swift
//  ImageFromURL
//
//  Created by Benny Davidovitz on 07/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        /*
        SDImageCache.shared().clearMemory()
        SDImageCache.shared().clearDisk(onCompletion: nil)
        */
        imageView.image = nil
        
        guard let url = URL(string: "http://www.sftravel.com/sites/sftraveldev.prod.acquia-sites.com/files/SanFrancisco_0.jpg") else{
            return
        }
        
        indicator.startAnimating()
        
        imageView.sd_setImage(with: url) { (image, error, cachType, url) in
            self.indicator.stopAnimating()
        }
        /*
        imageView.sd_setImage(with: <#T##URL?#>) { (<#UIImage?#>, <#Error?#>, <#SDImageCacheType#>, <#URL?#>) in
            <#code#>
        }*/
        
        //imageView.sd_setImage(with: url)
        
        /*
        sender.isEnabled = false
        indicator.startAnimating()
        
        //go to background thread
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url) else{
                DispatchQueue.main.async {
                    self.indicator.stopAnimating()
                    sender.isEnabled = true
                }
                print("no data")
                return
            }
            
            let image = UIImage(data: data)
            
            //back to main thread
            DispatchQueue.main.async {
                self.indicator.stopAnimating()
                self.imageView.image = image
                sender.isEnabled = true
            }
        }
        */
        
        
        
    }


}














