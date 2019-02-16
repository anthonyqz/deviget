//
//  RedditResponseTest.swift
//  devigetModuleTests
//
//  Created by Christian Quicano on 2/16/19.
//  Copyright © 2019 christianquicano. All rights reserved.
//

import XCTest
@testable import devigetModule

class RedditResponseTest:XCTestCase {
    
    func testRedditResponseStruct() {
        if let data = FakeDataManager.jsonData(resource: "entries_success_ok") {
            do {
                let response = try JSONDecoder().decode(RedditResponse.self, from: data)
                XCTAssertNotNil(response)
                XCTAssertTrue(response.data?.children?.count ?? 0 > 0)
                XCTAssertNotNil(response.data?.children?.first?.data?.author_fullname)
            } catch {
                XCTAssertNil(error, error.localizedDescription)
            }
        } else {
            XCTFail("Wrong json file")
        }
    }
    
}
