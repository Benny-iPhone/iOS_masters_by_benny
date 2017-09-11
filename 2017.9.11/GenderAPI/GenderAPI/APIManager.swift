//
//  APIManager.swift
//  GenderAPI
//
//  Created by Benny Davidovitz on 11/09/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import Foundation
import Alamofire

class APIManager{
    
    static let shared = APIManager()
    
    private let url = "https://gender-api.com/get"
    private let apiKey = "mvabClVyGwZEaKEpxW"
    
    typealias Callback = (_ err : Error?, _ result : GenderResult?) -> Void
    
    func getGenderBy(name : String, callback : @escaping Callback){
        
        let params : [String:Any] = [
            "name":name,
            "key":apiKey
        ]
        
        Alamofire.request(self.url, method: .get, parameters: params).responseJSON { (dataRes) in
            guard let dict = dataRes.result.value as? [String:Any] else{
                callback(dataRes.error, nil)
                return
            }
            
            callback(nil, GenderResult(dict))
        }
        
    }
    
    func getGenderBy(email : String, callback : @escaping Callback){
        
        let params : [String:Any] = [
            "email":email,
            "key":apiKey
        ]
        
        Alamofire.request(self.url, method: .get, parameters: params).responseJSON { (dataRes) in
            guard let dict = dataRes.result.value as? [String:Any] else{
                callback(dataRes.error, nil)
                return
            }
            
            callback(nil, GenderResult(dict))
        }
        
        
        
    }
    
}











