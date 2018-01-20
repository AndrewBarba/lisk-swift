//
//  PeersListTests.swift
//  Lisk
//
//  Created by Andrew Barba on 1/8/18.
//

import XCTest
@testable import Lisk

class PeersListTests: LiskTestCase {

    func testMainnetList() {
        let peers = Peers(client: mainNetClient)
        let response = tryRequest { peers.peers(limit: 5, completionHandler: $0) }
        XCTAssert(response.success)
        XCTAssertEqual(response.peers.count, 5)
    }
}
