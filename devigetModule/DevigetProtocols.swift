//
//  DevigetProtocols.swift
//  devigetModule
//
//  Created by Christian Quicano on 2/16/19.
//  Copyright © 2019 christianquicano. All rights reserved.
//

import Foundation

/**
 Customs protocols for posts views
 */
public protocol PostsViewDelegate:class {
    
    /**
     Func called when the presenter gets the list of posts
     
     - Parameters:
     - entries: entries model
     */
    func showEntries(_ entries:[EntryReddit])
    
    /**
     Func called when the presenter gets the after id of the last post
     
     - Parameters:
     - after: id of the last post
     */
    func sendAfterPost(_ after:String?)
    
    /**
     Generic func to set the presenter
     
     - Parameters:
     - presenter: Presenter of view
     */
    func setPresenter(_ presenter:PostsPresenterDelegate?)
    
    /**
     Generic func to handle network error
     
     - Parameters:
     - error: gets the error in object Error (optional)
     */
    func showNetworkError(_ error:Error?)
}


/**
 Posts presenter protocol
*/
public protocol PostsPresenterDelegate:class {
    
    /**
     Generic func to destroy singleton
     */
    static func destroyInstance()
    
    /**
     Generic func to load posts
     */
    func loadPosts()
}


/**
Repository protocols
*/
public protocol PostsRemoteDataSource : class {
    
    /**
     destroy singleton
     */
    static func destroyInstance()
    
    /**
     Generic fetch with success and failure, you will define default value as nil in the func
     
     - Parameters:
     - type: Type of object, it must be Decodable
     - success: Callback on success fetch, return Decodable Object
     - failure: Callback on error
     */
    func fetchData<T>(for type:T.Type
        , success:@escaping (T?)->()
        , failure:@escaping (Error?)->())
        where T:Decodable
    
    /**
     Generic func to set DataManager
     
     - Parameters:
     - networkManager: Object
     */
    func setDataManager(_ dataManager: DataSourceDelegate?)
    
    /**
     Generic func to update url
     
     - Parameters:
     - url: url of posts
     */
    func updateUrl(_ url: String?)
}


/**
 DataSourceDelegate protocols
 */
public protocol DataSourceDelegate:class {
    
    /**
     Generic func to set DataManager
     
     - Parameters:
     - url: url of networking
     - success: object data
     - failure: Callback on error
     */
    func requestJson(url:String
        , success:@escaping (Data?)->()
        , failure:@escaping (Error?)->())
}
