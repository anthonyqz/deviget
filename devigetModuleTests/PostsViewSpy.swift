//
//  PostsViewSpy.swift
//  devigetModuleTests
//
//  Created by Christian Quicano on 2/16/19.
//  Copyright © 2019 christianquicano. All rights reserved.
//

import XCTest
@testable import devigetModule

class PostsViewSpy: PostsViewDelegate {
    
    var showEntriesExpectation: XCTestExpectation?
    var sendAfterPostExpectation: XCTestExpectation?
    var setPresenterExpectation: XCTestExpectation?
    var showNetworkErrorExpectation: XCTestExpectation?
    
    func showEntries(_ entries:[EntryReddit]) {
        showEntriesExpectation?.fulfill()
    }
    
    func sendAfterPost(_ after:String?) {
        sendAfterPostExpectation?.fulfill()
    }
    
    func setPresenter(_ presenter:PostsPresenterDelegate?) {
        setPresenterExpectation?.fulfill()
    }
    
    func showNetworkError(_ error:Error?) {
        showNetworkErrorExpectation?.fulfill()
    }
}
