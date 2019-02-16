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
    
}
