//
//  PostsRepository.swift
//  devigetModule
//
//  Created by Christian Quicano on 2/16/19.
//  Copyright © 2019 christianquicano. All rights reserved.
//

import Foundation

public class PostsRepository {
    
    //MARK:- static properties
    static private var shared:PostsRepository?
    
    //MARK:- static func
    public static func getInstace(withRemoteRepository remoteRepository:PostsRemoteDataSource? = nil) -> PostsRepository? {
        if shared == nil {
            shared = PostsRepository()
        }
        shared?.remoteRepository = remoteRepository
        return shared
    }
    
    
    //MARK:- private properties
    weak private var remoteRepository:PostsRemoteDataSource?
    
    //MARK:- private func
    private init() {}

}

//MARK:- PostsRemoteDataSource
extension PostsRepository:PostsRemoteDataSource {
    
    public static func destroyInstance() {
        shared = nil
    }
    
    public func fetchData<T>(for type: T.Type
        , success: @escaping (T?) -> ()
        , failure: @escaping (Error?) -> ())
        where T : Decodable {
        remoteRepository?.fetchData(for: type
            , success: success
            , failure: failure)
    }
    
    public func setDataManager(_ dataManager: DataSourceDelegate?) {
        remoteRepository?.setDataManager(dataManager)
    }
    
}
