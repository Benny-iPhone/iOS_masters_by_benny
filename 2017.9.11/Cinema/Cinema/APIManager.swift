//
//  APIManager.swift
//  Cinema
//
//  Created by Benny Davidovitz on 11/09/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import Foundation
import Alamofire

class APIManager{
    
    static let shared = APIManager()
    
    private let baseURL = "https://api.themoviedb.org/3"
    private let apiKey = "e898f9a386bfdb67610421b879360e02"
    
    enum Endpoint : String{
        case nowPlaying = "/movie/now_playing"
        case topRated = "/movie/top_rated"
    }
    
    typealias Callback = (_ arr : [Movie]) -> Void
    
    func getMovies(endpoint : Endpoint, page : Int, callback : @escaping Callback)
    {
        let params : [String:Any] = [
            "api_key":self.apiKey,
            "language":Locale.current.languageCode ?? "en",
            "page":page
        ]
        
        let url = baseURL + endpoint.rawValue
        
        Alamofire.request(url, method: .get, parameters: params).responseJSON { (dataRes) in
            
            guard let json = dataRes.result.value as? [String:Any] else{
                callback([])
                return
            }
            
            let results = json["results"] as? [[String:Any]] ?? []
            let arr : [Movie] = results.flatMap{Movie($0)}
            callback(arr)
            
//            results.flatMap({ (dict : [String : Any]) -> Movie? in
//                return Movie(dict)
//            })
//            
        }
    }
    
    
}




















