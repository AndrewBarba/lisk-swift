//
//  PeersVersionTests.swift
//  LiskTests
//
//  Created by Andrew Barba on 1/8/18.
//

import XCTest
@testable import Lisk

class PeersVersionTests: LiskTestCase {

    func testMainnetVersion() {
        let peers = Peers(client: mainNetClient)
        let response = tryRequest { peers.version(completionHandler: $0) }
        XCTAssert(response.success)
        XCTAssertEqual(response.version, "0.9.13")
    }

    func testBetanetVersion() {
        let peers = Peers(client: betaNetClient)
        let response = tryRequest { peers.version(completionHandler: $0) }
        XCTAssert(response.success)
        XCTAssertEqual(response.version, "1.0.0")
    }
}
