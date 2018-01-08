//
//  TransactionsListTest.swift
//  LiskTests
//
//  Created by Andrew Barba on 1/2/18.
//

import XCTest
@testable import Lisk

class TransactionsListTests: LiskTestCase {

    func testMainnetList() {
        let transactions = Transactions(client: mainNetClient)
        let response = tryRequest { transactions.transactions(completionHandler: $0) }
        XCTAssert(response.success)
        XCTAssertGreaterThan(response.transactions.count, 0)
    }

    func testMainnetListSender() {
        let transactions = Transactions(client: mainNetClient)
        let response = tryRequest { transactions.transactions(sender: andrewAddress, completionHandler: $0) }
        XCTAssert(response.success)
        XCTAssertGreaterThan(response.transactions.count, 0)
    }

    func testMainnetListRecipient() {
        let transactions = Transactions(client: mainNetClient)
        let response = tryRequest { transactions.transactions(recipient: andrewAddress, completionHandler: $0) }
        XCTAssert(response.success)
        XCTAssertGreaterThan(response.transactions.count, 0)
    }

    func testMainnetLimit() {
        let transactions = Transactions(client: mainNetClient)
        let response = tryRequest { transactions.transactions(limit: 2, completionHandler: $0) }
        XCTAssert(response.success)
        XCTAssertEqual(response.transactions.count, 2)
    }
}
