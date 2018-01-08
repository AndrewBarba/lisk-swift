//
//  PeersGetTests.swift
//  LiskTests
//
//  Created by Andrew Barba on 1/8/18.
//

import XCTest
@testable import Lisk

class PeersGetTests: LiskTestCase {

    func testMainnetGet() {
        let peers = Peers(client: mainNetClient)
        let response = tryRequest { peers.peer(ip: "165.227.215.126", port: 8000, completionHandler: $0) }
        XCTAssert(response.success)
        XCTAssertEqual(response.peer.version, "0.9.11")
    }
}
