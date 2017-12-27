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
        let status = tryRequest { loader.status($0) }
        XCTAssert(status.success)
        XCTAssert(status.loaded)
        XCTAssert(status.now > 0)
        print(status)
    }

    func testMainPeerStatus() {
        let loader = Loader(client: mainPeerClient)
        let status = tryRequest { loader.status($0) }
        XCTAssert(status.success)
        XCTAssert(status.loaded)
        XCTAssert(status.now > 0)
        print(status)
    }
}
