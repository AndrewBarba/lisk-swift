//
//  LoaderStatusPingTests.swift
//  LiskTests
//
//  Created by Andrew Barba on 12/27/17.
//

import XCTest
@testable import Lisk

class LoaderStatusPingTests: LiskTestCase {

    func testMainnetPingStatus() {
        let loader = Loader(client: mainNetClient)
        let response = tryRequest { loader.pingStatus(completionHandler: $0) }
        XCTAssert(response.success)
    }

    func testMainPeerPingStatus() {
        let loader = Loader(client: mainPeerClient)
        let response = tryRequest { loader.pingStatus(completionHandler: $0) }
        XCTAssert(response.success)
    }
}
