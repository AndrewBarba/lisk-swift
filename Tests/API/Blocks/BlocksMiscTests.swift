//
//  BlocksMiscTests.swift
//  LiskTests
//
//  Created by Andrew Barba on 1/9/18.
//

import XCTest
@testable import Lisk

class BlocksMiscTests: LiskTestCase {

    func testMainnetFee() {
        let blocks = Blocks(client: mainNetClient)
        let response = tryRequest { blocks.fee(completionHandler: $0) }
        XCTAssert(response.success)
    }

    func testMainnetFees() {
        let blocks = Blocks(client: mainNetClient)
        let response = tryRequest { blocks.fees(completionHandler: $0) }
        XCTAssert(response.success)
    }

    func testMainnetReward() {
        let blocks = Blocks(client: mainNetClient)
        let response = tryRequest { blocks.reward(completionHandler: $0) }
        XCTAssert(response.success)
    }

    func testMainnetSupply() {
        let blocks = Blocks(client: mainNetClient)
        let response = tryRequest { blocks.supply(completionHandler: $0) }
        XCTAssert(response.success)
    }

    func testMainnetHeight() {
        let blocks = Blocks(client: mainNetClient)
        let response = tryRequest { blocks.height(completionHandler: $0) }
        XCTAssert(response.success)
    }

    func testMainnetStatus() {
        let blocks = Blocks(client: mainNetClient)
        let response = tryRequest { blocks.status(completionHandler: $0) }
        XCTAssert(response.success)
    }

    func testMainnetNethash() {
        let blocks = Blocks(client: mainNetClient)
        let response = tryRequest { blocks.nethash(completionHandler: $0) }
        XCTAssert(response.success)
    }

    func testMainnetMilestone() {
        let blocks = Blocks(client: mainNetClient)
        let response = tryRequest { blocks.milestone(completionHandler: $0) }
        XCTAssert(response.success)
    }
}
