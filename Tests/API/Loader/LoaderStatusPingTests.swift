//
//  LoaderStatusPingTests.swift
//  LiskTests
//
//  Created by Andrew Barba on 12/27/17.
//  Copyright © 2017 Andrew Barba. All rights reserved.
//

import XCTest
@testable import Lisk

class LoaderStatusPingTests: LiskTestCase {

    func testMainnetPingStatus() {
        let loader = Loader(client: mainNetClient)
        let ping = tryRequest { loader.pingStatus($0) }
        XCTAssert(ping.success)
    }

    func testMainPeerPingStatus() {
        let loader = Loader(client: mainPeerClient)
        let ping = tryRequest { loader.pingStatus($0) }
        XCTAssert(ping.success)
    }
}
