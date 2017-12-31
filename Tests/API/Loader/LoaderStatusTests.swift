//
//  LoaderStatusTests.swift
//  LiskTests
//
//  Created by Andrew Barba on 12/11/17.
//  Copyright © 2017 Andrew Barba. All rights reserved.
//

import XCTest
@testable import Lisk

class LoaderStatusTests: LiskTestCase {
    
    func testMainnetStatus() {
        let loader = Loader(client: mainNetClient)
        let response = tryRequest { loader.status(completionHandler: $0) }
        XCTAssert(response.success)
        XCTAssert(response.loaded)
        XCTAssert(response.now > 0)
    }

    func testMainPeerStatus() {
        let loader = Loader(client: mainPeerClient)
        let response = tryRequest { loader.status(completionHandler: $0) }
        XCTAssert(response.success)
        XCTAssert(response.loaded)
        XCTAssert(response.now > 0)
    }
}
