//
//  AccountsBalanceTests.swift
//  Lisk
//
//  Created by Andrew Barba on 12/31/17.
//

import XCTest
@testable import Lisk

class AccountsBalanceTests: LiskTestCase {

    func testMainnetBalance() {
        let accounts = Accounts(client: mainNetClient)
        let response = tryRequest { accounts.balance(address: andrewAddress, completionHandler: $0) }
        XCTAssert(response.success)
        XCTAssert(Double(response.balance)! > 0)
    }

    func testBadAddressBalance() {
        let address = UUID().uuidString
        let accounts = Accounts(client: mainNetClient)
        let response = tryRequestError { accounts.balance(address: address, completionHandler: $0) }
        XCTAssertFalse(response.success)
        XCTAssertEqual(response.message, "Object didn't pass validation for format address: \(address)")
    }
}
