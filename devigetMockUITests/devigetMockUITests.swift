//
//  devigetMockUITests.swift
//  devigetMockUITests
//
//  Created by Christian Quicano on 2/17/19.
//  Copyright © 2019 christianquicano. All rights reserved.
//

import XCTest

class devigetMockUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDismissPosts() {
        sleep(1)
        
        let authorPost = "t2_eg0d02d"
        let dimissButtonTitle = "Dismiss Post"
        let navigationBar = "Post Detail"
        
        let app = XCUIApplication()
        
        //for ipad
        let barButton = app.navigationBars[navigationBar].buttons[" "]
        if barButton.exists {
            barButton.tap()
        }
        
        let tablesQuery = app.tables
        let cell = tablesQuery.cells.containing(.staticText, identifier: authorPost)
        let titleAuthor = cell.staticTexts[authorPost]
        XCTAssertTrue(titleAuthor.exists)
        let dismissButton = cell.buttons[dimissButtonTitle]
        XCTAssertNotNil(dismissButton)
        dismissButton.tap()
        let titleAuthorNil = tablesQuery.cells.staticTexts[authorPost]
        XCTAssertFalse(titleAuthorNil.exists)
    }

}
