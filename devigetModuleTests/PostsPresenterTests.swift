//
//  PostsPresenterTests.swift
//  devigetModuleTests
//
//  Created by Christian Quicano on 2/16/19.
//  Copyright © 2019 christianquicano. All rights reserved.
//

import XCTest
@testable import devigetModule

class PostsPresenterTests: XCTestCase {
    
    var viewSpy = PostsViewSpy()
    var dataManager = FakeDataManager()
    var repository:PostsRepository!
    var remoteRepository:PostsRepositoryRemote!
    var presenter:PostsPresenter!
    
    override func setUp() {
        remoteRepository = PostsRepositoryRemote.getInstace(with: "http://deviget.pe")
        repository = PostsRepository.getInstace(withRemoteRepository: remoteRepository)
        repository.setDataManager(dataManager)
        presenter = PostsPresenter.getInstace(with: repository, viewDelegate: viewSpy)
    }
    
    override func tearDown() {
        PostsRepository.destroyInstance()
        PostsRepositoryRemote.destroyInstance()
        PostsPresenter.destroyInstance()
    }
    
    func testPostsSuccessOk() {
        //Given
        dataManager.setJsonFileNameToSuccess("entries_success_ok")
        viewSpy.showEntriesExpectation = expectation(description: "method of view is called")
        viewSpy.sendAfterPostExpectation = expectation(description: "method of view is called")
        viewSpy.setPresenterExpectation = expectation(description: "method of view is called")
        
        //When
        viewSpy.setPresenter(presenter)
        presenter.loadPosts()
        
        //Then
        waitForExpectations(timeout: 3, handler: nil)
    }
    
    func testPostsSuccessEmpty() {
        //Given
        viewSpy.showEntriesExpectation = expectation(description: "method of view is called")
        viewSpy.sendAfterPostExpectation = expectation(description: "method of view is called")
        viewSpy.setPresenterExpectation = expectation(description: "method of view is called")
        
        //When
        viewSpy.setPresenter(presenter)
        presenter.loadPosts()
        
        //Then
        waitForExpectations(timeout: 3, handler: nil)
    }
    
    func testPostsSuccessFailed() {
        //Given
        let errorDescription = "Some error message"
        let errorToBeReturned = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: errorDescription])
        dataManager.error = errorToBeReturned
        viewSpy.setPresenterExpectation = expectation(description: "method of view is called")
        viewSpy.showNetworkErrorExpectation = expectation(description: "method of view is called")
        
        //When
        viewSpy.setPresenter(presenter)
        presenter.loadPosts()
        
        //Then
        waitForExpectations(timeout: 3, handler: nil)
    }
}
