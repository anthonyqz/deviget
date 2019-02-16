//
//  DataManager.swift
//  deviget
//
//  Created by Christian Quicano on 2/16/19.
//  Copyright © 2019 christianquicano. All rights reserved.
//

import Foundation
import devigetModule

class DataManager: DataSourceDelegate {
    static let shared = DataManager()
    
    func requestJson(url: String
        , success: @escaping (Data?) -> ()
        , failure: @escaping (Error?) -> ()) {
        
        guard let urlCreated = URL(string: url) else {
            failure(nil)
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: urlCreated) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    failure(error)
                } else {
                    success(data)
                }
            }
        }
        dataTask.resume()
    }
    
    func downloadImage(from url:String?, name:String?, completion:@escaping (UIImage?)->()) {
        guard let url = url
            , url.count > 0
            , let urlCreated = URL(string: url) else {
            completion(nil)
            return
        }
        
        //verify if the image is saved
        if let data = Util.readData(withName: name)
            , let image = UIImage(data: data) {
            completion(image)
            return
        }
        
        //download image
        let dataTask = URLSession.shared.dataTask(with: urlCreated) { (data, response, error) in
            DispatchQueue.main.async {
                if let data = data
                    , let image = UIImage(data: data) {
                    completion(image)
                    //save image
                    Util.write(data: data, withName: name)
                } else {
                    completion(nil)
                }
            }
        }
        dataTask.resume()
    }
    
}
