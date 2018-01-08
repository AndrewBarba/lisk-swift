//
//  DelegatesCountTests.swift
//  LiskTests
//
//  Created by Andrew Barba on 1/8/18.
//

import XCTest
@testable import Lisk

class DelegatesCountTests: LiskTestCase {

    func testMainnetCount() {
        let delegates = Delegates(client: mainNetClient)
        let response = tryRequest { delegates.count(completionHandler: $0) }
        XCTAssert(response.success)
        XCTAssertGreaterThanOrEqual(response.count, 101)
    }
}
