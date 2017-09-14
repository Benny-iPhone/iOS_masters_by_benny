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
    let largePosterURL : URL?
    let overview : String?
    let releaseDate : String?
    
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
            let urlString = "https://image.tmdb.org/t/p/w185" + str
            self.posterURL = URL(string: urlString)
            
            let largeUrlString = "https://image.tmdb.org/t/p/w780" + str
            self.largePosterURL = URL(string: largeUrlString)
            
        } else {
            self.posterURL = nil
            self.largePosterURL = nil
        }
        
        self.releaseDate = dict["release_date"] as? String
    }
}

class DetailedMovie : Movie{
    
    let geners : String?
    let imdbId : String?
    let budget : Int64?

    override init?(_ dict: [String : Any]) {
        let rawArr = dict["genres"] as? [[String:Any]]
        self.geners = rawArr?.flatMap{$0["name"] as? String}.joined(separator: ", ")
        
        self.imdbId = dict["imdb_id"] as? String
        self.budget = dict["budget"] as? Int64
        
        super.init(dict)
    }
}


















