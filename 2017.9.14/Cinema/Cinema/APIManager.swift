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
        case latest = "/movie/latest"
        case popular = "/movie/popular"
        case upcoming = "/movie/upcoming"
        
        static let all : [Endpoint] = [.nowPlaying,
                                       .topRated,
                                       .latest,
                                       .popular,
                                       .upcoming]
        
        var name : String{
            get{
                switch self {
                case .nowPlaying: return "בקולנוע"
                case .topRated: return "המדורגים"
                case .latest: return "החדשים"
                case .popular: return "האהובים"
                case .upcoming: return "בקרוב"
                }
            }
        }
    }
    
    typealias Callback = (_ arr : [Movie],_ err : Error?) -> Void
    
    func getDetails(of movie : Movie, callback : @escaping (DetailedMovie?)->Void){
        let params : [String:Any] = [
            "api_key":self.apiKey,
            "language":Locale.current.languageCode ?? "en"
        ]
        //                  /movie/{movie_id}
        let url = baseURL + "/movie/\(movie.id)"
        
        Alamofire.request(url, method: .get, parameters: params).responseJSON { (dataRes) in
            
            guard let json = dataRes.result.value as? [String:Any] else{
                callback(nil)
                return
            }
            
            let m = DetailedMovie(json)
            callback(m)
            
        }
        
        
    }
    
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
                callback([],dataRes.error)
                //print(dataRes.error)
                return
            }
            
            let success = json["success"] as? Bool ?? true
            guard success else{
                
                let code = json["status_code"] as? Int ?? 500
                let reason = json["status_message"] as? String ?? "unknown error"

                let err = NSError(domain: "imoviedb", code: code, userInfo: [
                    NSLocalizedDescriptionKey:reason
                    ])
                
                callback([], err as Error)
                return
                
            }
            
            let results : [[String:Any]]
            
            if endpoint == .latest{
                results = [json]
            } else {
                results = json["results"] as? [[String:Any]] ?? []
            }
            
            let arr : [Movie] = results.flatMap{Movie($0)}
            callback(arr,nil)
            
//            results.flatMap({ (dict : [String : Any]) -> Movie? in
//                return Movie(dict)
//            })
//            
        }
    }
    
    
}




















