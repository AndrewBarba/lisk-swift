//
//  AccountsAccountTests.swift
//  LiskTests
//
//  Created by Andrew Barba on 12/31/17.
//

import XCTest
@testable import Lisk

class AccountsAccountTests: LiskTestCase {

    func testMainnetAccount() {
        let accounts = Accounts(client: mainNetClient)
        let response = tryRequest { accounts.account(address: andrewAddress, completionHandler: $0) }
        XCTAssert(response.success)
        XCTAssertEqual(response.account.address, andrewAddress)
        XCTAssertEqual(response.account.publicKey, andrewPublicKey)
    }
}
