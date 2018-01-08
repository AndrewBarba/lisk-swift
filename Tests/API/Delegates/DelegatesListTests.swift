//
//  DelegatesListTests.swift
//  LiskTests
//
//  Created by Andrew Barba on 1/8/18.
//

import XCTest
@testable import Lisk

class DelegatesListsTests: LiskTestCase {

    func testMainnetList() {
        let delegates = Delegates(client: mainNetClient)
        let response = tryRequest { delegates.delegates(limit: 5, completionHandler: $0) }
        XCTAssert(response.success)
        XCTAssertEqual(response.delegates.count, 5)
    }

    func testMainnetSearch() {
        let delegates = Delegates(client: mainNetClient)
        let response = tryRequest { delegates.search(query: "andr", completionHandler: $0) }
        XCTAssert(response.success)
        XCTAssertGreaterThan(response.delegates.count, 0)
    }
}
