//
//  DelegatesVotesTests.swift
//  LiskTests
//
//  Created by Andrew Barba on 1/8/18.
//

import XCTest
@testable import Lisk

class DelegatesVotesTests: LiskTestCase {

    func testMainnetVotes() {
        let delegates = Delegates(client: mainNetClient)
        let response = tryRequest { delegates.votes(address: andrewAddress, completionHandler: $0) }
        XCTAssert(response.success)
        XCTAssertGreaterThan(response.delegates.count, 0)
    }

    func testMainnetVoters() {
        let delegates = Delegates(client: mainNetClient)
        let response = tryRequest { delegates.voters(publicKey: andrewPublicKey, completionHandler: $0) }
        XCTAssert(response.success)
        XCTAssertGreaterThan(response.accounts.count, 0)
    }
}
