//
//  DelegatesGetTests.swift
//  LiskTests
//
//  Created by Andrew Barba on 1/8/18.
//

import XCTest
@testable import Lisk

class DelegatesGetTests: LiskTestCase {

    func testMainnetGetUsername() {
        let delegates = Delegates(client: mainNetClient)
        let response = tryRequest { delegates.delegate(username: andrewUsername, completionHandler: $0) }
        XCTAssert(response.success)
        XCTAssertEqual(response.delegate.username, andrewUsername)
        XCTAssertEqual(response.delegate.address, andrewAddress)
        XCTAssertEqual(response.delegate.publicKey, andrewPublicKey)
    }

    func testMainnetGetPublicKey() {
        let delegates = Delegates(client: mainNetClient)
        let response = tryRequest { delegates.delegate(publicKey: andrewPublicKey, completionHandler: $0) }
        XCTAssert(response.success)
        XCTAssertEqual(response.delegate.username, andrewUsername)
        XCTAssertEqual(response.delegate.address, andrewAddress)
        XCTAssertEqual(response.delegate.publicKey, andrewPublicKey)
    }
}
