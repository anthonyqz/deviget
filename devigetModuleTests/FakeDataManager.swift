//
//  FakeDataManager.swift
//  devigetModuleTests
//
//  Created by Christian Quicano on 2/16/19.
//  Copyright © 2019 christianquicano. All rights reserved.
//

import Foundation
@testable import devigetModule

class FakeDataManager:DataSourceDelegate {
    
    static let shared = FakeDataManager()
    
    private var data:Data?
    var error:Error?
    
    //MARK:- static func
    static func jsonData(resource:String) -> Data? {
        do {
            if let file = Bundle(for: FakeDataManager.self).url(forResource: resource, withExtension: "json") {
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
        data = FakeDataManager.jsonData(resource: name)
    }
}
