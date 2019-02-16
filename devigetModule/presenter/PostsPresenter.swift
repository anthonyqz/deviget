//
//  PostsPresenter.swift
//  devigetModule
//
//  Created by Christian Quicano on 2/16/19.
//  Copyright © 2019 christianquicano. All rights reserved.
//

import Foundation

public class PostsPresenter {
    
    //MARK:- static properties
    static private var shared:PostsPresenter?
    
    //MARK:- static func
    public static func getInstace(with repository:PostsRemoteDataSource?, viewDelegate:PostsViewDelegate?) -> PostsPresenter? {
        if shared == nil {
            shared = PostsPresenter()
        }
        shared?.repository = repository
        shared?.viewDelegate = viewDelegate
        return shared
    }
    
    //MARK:- private properties
    weak private var repository:PostsRemoteDataSource?
    weak private var viewDelegate:PostsViewDelegate?
    
    //MARK:- private func
    private init() {}
    
    private func handleResponse(_ reddit:RedditResponse?) {
        guard let reddit = reddit
            , let data = reddit.data
            , let children = data.children
            , children.count > 0 else {
            viewDelegate?.sendAfterPost(nil)
            viewDelegate?.showEntries([])
            return
        }
        
        var entries = [EntryReddit]()
        for child in children {
            if let entry = child.data {
                entries.append(entry)
            }
        }
        viewDelegate?.sendAfterPost(data.after)
        viewDelegate?.showEntries(entries)
    }
    
}

//MARK:- PostsPresenterDelegate
extension PostsPresenter:PostsPresenterDelegate {
    
    public static func destroyInstance() {
        shared = nil
    }
    
    public func loadPosts() {
        repository?.fetchData(for: RedditResponse.self
            , success: { [weak self] (reddit) in
                self?.handleResponse(reddit)
        }
            , failure: { [weak self] (error) in
                self?.viewDelegate?.showNetworkError(error)
        })
    }
    
}
