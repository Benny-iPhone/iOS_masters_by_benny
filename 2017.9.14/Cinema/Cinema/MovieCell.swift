//
//  MovieCell.swift
//  Cinema
//
//  Created by Benny Davidovitz on 14/09/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import HCSStarRatingView
import SDWebImage

class MovieCell: UITableViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var originalTitleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var ratingView: HCSStarRatingView!
    
    func configure(with movie : Movie){
        titleLabel.text = movie.title
        originalTitleLabel.text = movie.originalTitle
        dateLabel.text = movie.releaseDate
        
        let v = movie.vote ?? 0
        ratingView.value = CGFloat(v/2)
        
        posterImageView.sd_setImage(with: movie.posterURL)
    }
    
    
}













