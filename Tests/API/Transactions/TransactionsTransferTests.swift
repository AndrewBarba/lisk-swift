//
//  TransactionsTransferTests.swift
//  LiskTests
//
//  Created by Andrew Barba on 1/7/18.
//

import XCTest
@testable import Lisk

class TransactionsTransferTests: LiskTestCase {

    func testMainnetSendNoFunds() {
        let transactions = Transactions(client: mainNetClient)
        let response = tryRequestError { transactions.transfer(lsk: 1, to: mainNetAddress, secret: mainNetExampleSecret, completionHandler: $0) }
        XCTAssertFalse(response.success)
        XCTAssertEqual(response.message, "Account does not have enough LSK: 5549607903333983622L balance: 0")
    }
}
