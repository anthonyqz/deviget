//
//  FakeDataManager.swift
//  devigetModuleTests
//
//  Created by Christian Quicano on 2/16/19.
//  Copyright © 2019 christianquicano. All rights reserved.
//

import Foundation
@testable import devigetModule

class DataManager:DataSourceDelegate {
    
    static let shared = DataManager()
    
    private var data:Data?
    var error:Error?
    
    //MARK:- static func
    static func jsonData(resource:String) -> Data? {
        do {
            if let file = Bundle(for: DataManager.self).url(forResource: resource, withExtension: "json") {
                let data = try Data(contentsOf: file)
                return data
            } else {
                return nil
            }
        } catch {
            return nil
        }
    }
    
    //MARK:- public func
    public func requestJson(url:String
        , success:@escaping (Data?)->()
        , failure:@escaping (Error?)->()) {
        if let error = error {
            failure(error)
        } else {
            success(data)
        }
    }
    
    func setJsonFileNameToSuccess(_ name:String) {
        data = DataManager.jsonData(resource: name)
    }
    
    func downloadImage(from url:String?, name:String?, completion:@escaping (UIImage?)->()) {
        completion(nil)
    }
}
