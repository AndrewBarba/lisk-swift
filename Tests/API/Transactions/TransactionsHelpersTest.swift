//
//  TransactionHelpersTest.swift
//  LiskTests
//
//  Created by Andrew Barba on 1/7/18.
//

import XCTest
@testable import Lisk

class TransactionsHelpersTests: LiskTestCase {

    func testPrepare() {
        let transaction = try! TransactionHelpers.prepare(type: 0, amount: 1.12, to: mainNetAddress, secret: mainNetExampleSecret, timestamp: 10)

        // Check bytes
        XCTAssertEqual(transaction.typeBytes, [0])
        XCTAssertEqual(transaction.timestampBytes, [10, 0, 0, 0])
        XCTAssertEqual(transaction.senderPublicKeyBytes, [30, 226, 56, 16, 69, 67, 76, 11, 154, 150, 76, 190, 127, 133, 62, 29, 42, 114, 222, 13, 151, 152, 129, 230, 97, 229, 39, 142, 166, 196, 10, 72])
        XCTAssertEqual(transaction.recipientIdBytes, [207, 255, 63, 233, 51, 131, 193, 241])
        XCTAssertEqual(transaction.amountBytes, [0, 252, 172, 6, 0, 0, 0, 0])
        XCTAssertEqual(transaction.signature, "35d721d1524c48d32bfaf3b33fd826968d3c99d682e661cfbc666e1cd1fac48d1e58903d6e7a84fd34bcd0b2874f720aa453bc7027442adf0c29443650725106")
        XCTAssertEqual(transaction.id, "730261182562463085")
    }
}
