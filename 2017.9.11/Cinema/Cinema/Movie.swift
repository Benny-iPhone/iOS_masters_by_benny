//
//  Movie.swift
//  Cinema
//
//  Created by Benny Davidovitz on 11/09/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import Foundation

class Movie{
    let id : Int
    let vote : Double?
    let title : String?
    let originalTitle : String?
    let posterURL : URL?
    let overview : String?
    
    init?(_ dict : [String:Any]) {
        guard let id = dict["id"] as? Int else{
            return nil
        }
        
        self.id = id
        self.vote = dict["vote_average"] as? Double
        self.title = dict["title"] as? String
        self.originalTitle = dict["original_title"] as? String
        self.overview = dict["overview"] as? String
        
        if let str = dict["poster_path"] as? String{
            let urlString = "http://image.tmdb.org/t/p/w185" + str
            self.posterURL = URL(string: urlString)
        } else {
            self.posterURL = nil
        }
    }
}



















