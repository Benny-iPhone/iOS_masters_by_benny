//
//  MovieDetailsViewController.swift
//  Cinema
//
//  Created by Benny Davidovitz on 14/09/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import SDWebImage

class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var genresLabel: UILabel!
    @IBOutlet weak var budgetLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var textView: UITextView!
    var movie : Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = movie?.title
        //navigationItem.prompt = movie?.originalTitle
        
        textView.text = movie?.overview
        imageView.sd_setImage(with: movie?.largePosterURL)
        
        if let dm = movie as? DetailedMovie{
            populate(with: dm)
            return
        }
        
        populate(with: nil)
        
        guard let movie = movie else{
            return
        }
        
        APIManager.shared.getDetails(of: movie) { (dm) in
            self.populate(with: dm)
            self.movie = dm
        }
        
    }
    
    func populate(with dm : DetailedMovie?){
        genresLabel.text = dm?.geners
        
        if let budget = dm?.budget{
            let formatter = NumberFormatter()
            formatter.currencyCode = "USD"
            formatter.numberStyle = .currency
            
            budgetLabel.text = formatter.string(from: budget as NSNumber)
        } else {
            budgetLabel.text = nil
        }
        
        if dm != nil{
            let webButton = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(showWebAction))
            navigationItem.rightBarButtonItem = webButton
        }
    }
    
    func showWebAction(){
        
        guard let webVC = storyboard?.instantiateViewController(withIdentifier: "WebViewController") as? WebViewController else{
            return
        }
        
        guard let imdbId = (movie as? DetailedMovie)?.imdbId else{
            return
        }
        
        webVC.urlString = "https://www.imdb.com/title/" + imdbId
        
        navigationController?.pushViewController(webVC, animated: true)
        
    }
   
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        textView.contentOffset = .zero

    }


}







