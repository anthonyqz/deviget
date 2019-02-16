//
//  PostsRepositoryRemote.swift
//  devigetModule
//
//  Created by Christian Quicano on 2/16/19.
//  Copyright © 2019 christianquicano. All rights reserved.
//

import Foundation

public class PostsRepositoryRemote {
    
    //MARK:- static properties
    static private var shared:PostsRepositoryRemote?
    
    //MARK:- static func
    public static func getInstace(with url:String?) -> PostsRepositoryRemote? {
        if shared == nil {
            shared = PostsRepositoryRemote()
        }
        shared?.url = url
        return shared
    }
    
    public static func updateUrl(_ url: String?) {
        guard let shared = shared
            , let url = url
            else { return }
        shared.url = url
    }
    
    //MARK:- private properties
    private var url:String?
    private var dataManager: DataSourceDelegate?
    
    //MARK:- private func
    private init() { }
    
}

//MARK:- PostsRemoteDataSource
extension PostsRepositoryRemote:PostsRemoteDataSource {
    
    public static func destroyInstance() {
        shared = nil
    }
    
    public func fetchData<T>(for type: T.Type
        , success: @escaping (T?) -> ()
        , failure: @escaping (Error?) -> ())
        where T : Decodable {
            
            guard let url = url
                , url.count > 0
                , let dataManager = dataManager else {
                    let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "url or data manager doest not exist"])
                    failure(error)
                    return
            }
            
            dataManager.requestJson(url: url
                , success: { (data) in
                    if let data = data
                        , let model = try? JSONDecoder().decode(type, from: data) {
                        success(model)
                    } else {
                        success(nil)
                    }
            }
                , failure: { (error) in
                    failure(error)
            })
    }
    
    public func setDataManager(_ dataManager: DataSourceDelegate?) {
        self.dataManager = dataManager
    }
    
}
