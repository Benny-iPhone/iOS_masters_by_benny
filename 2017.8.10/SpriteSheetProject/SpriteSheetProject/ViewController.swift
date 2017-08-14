//
//  ViewController.swift
//  SpriteSheetProject
//
//  Created by Benny Davidovitz on 10/08/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

extension UIImageView{
    func toggleAnimation(){
        if self.isAnimating{
            stopAnimating()
        } else {
            startAnimating()
        }
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let bigImage = #imageLiteral(resourceName: "sprite_sheet_image")
        let images = bigImage.cropSpriteSheet(columns: 7, rows: 3)
        
        let imageView = UIImageView(image: images.first)
        imageView.center = self.view.center
        
        self.view.addSubview(imageView)
        
        imageView.animationImages = images
        imageView.animationDuration = 1.1 //seconds
        imageView.animationRepeatCount = 0
        
        imageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction(_:)))
        //let tapGesture = UITapGestureRecognizer(target: imageView, action: #selector(UIImageView.toggleAnimation))
        
        imageView.addGestureRecognizer(tapGesture)
        
    }
    
    func tapAction(_ sender : UITapGestureRecognizer){
        guard let imageView = sender.view as? UIImageView else {
            return
        }
        
        if imageView.isAnimating{
            imageView.stopAnimating()
        } else {
            imageView.startAnimating()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}











