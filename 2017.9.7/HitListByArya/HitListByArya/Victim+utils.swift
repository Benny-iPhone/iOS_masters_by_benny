//
//  Victim+utils.swift
//  HitListByArya
//
//  Created by Benny Davidovitz on 04/09/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

extension Victim{
    
    func removeImageFile(){
        guard let fileName = self.imageName else {
            //no file exist
            return
        }
        
        var url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        url.appendPathComponent(fileName)
        
        if FileManager.default.fileExists(atPath: url.path){
            try? FileManager.default.removeItem(at: url)
        }
        
    }
    
    var image : UIImage?{
        set{
            removeImageFile()
            
            guard let img = newValue else{
                return
            }
            
            guard let data = UIImageJPEGRepresentation(img, 0.7) else{
                return
            }
            
            var url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            
            let filename = UUID().uuidString + ".jpg"
            
            url.appendPathComponent(filename)
            
            do{
                try data.write(to: url)
                print(url)
                self.imageName = filename
            } catch {
                print(error)
            }
            
        }
        get{
            
            guard let filename = self.imageName else {
                return nil
            }
            
            var url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            url.appendPathComponent(filename)
            
            guard let data = try? Data(contentsOf: url) else{
                return nil
            }
            
            return UIImage(data: data)
        }
    }
    
}













